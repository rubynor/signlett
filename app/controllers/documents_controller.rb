class DocumentsController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def index
    @documents = Document.where(user_id: current_user.id)
  end

  def show
    @document = Document.find(params[:id])
  end

  def new
    @document = Document.new
  end

  def create
    # The array is sent as a string object, therefore split at , and make an array
    email_array = params[:document][:email].split(",")

    @document = Document.new(user: current_user, status: params[:document][:status], file: params[:document][:file])
    if @document.save
      @document.update!(file_path: rails_blob_path(@document.file, disposition: 'preview'))
      DocumentEvent.create!(document: @document, message: "#{@document.user.first_name} lastet opp dokument til signering")
      email_array.each do |email|
        @recipient = Recipient.new(document_id: @document.id, email: email)
        if @recipient.save
        else
          Document.delete(@document.id)
        end
      end
      send_mail(@document)
    else
      puts @document.errors.full_messages
      render json: @document.errors
    end
  end

  # Method for only sending mail to the first recipient that is not sent yet
  def send_mail(document)
    recipient = Recipient.find_first(document)
    if recipient.present?
      DocumentMailer.with(user: document.user,
                          email: recipient.email,
                          document: document).signature_email.deliver_later
      recipient.set_sent_true
      DocumentEvent.create!(document: document, message: "E-post sendt til #{recipient.email} ")
    end
  end

  protected

  def document_params
    params.require(:document).permit(:status, :file_path, :file, :email)
  end
end
