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
    @document = Document.new(status: params[:document][:status], file: params[:document][:file])
    @document.user_id = current_user.id
    if @document.save
      @document.update!(file_path: rails_blob_path(@document.file, disposition: 'preview'))
      @recipient = Recipient.new(document_id: @document.id, email: params[:document][:email])
      if @recipient.save
        DocumentMailer.with(user: current_user,
                            email: @recipient.email,
                            document: @document).signature_email.deliver_later
        render json: @document
      end
    else
      puts @document.errors.full_messages
      render json: @document.errors
    end
  end

  protected

  def document_params
    params.require(:document).permit(:status, :file_path, :file, :email)
  end
end
