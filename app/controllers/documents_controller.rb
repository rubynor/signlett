class DocumentsController < ApplicationController

  skip_before_action :verify_authenticity_token

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
    @document = Document.new(document_params)
    @document.user_id = current_user.id
    @document.file_path = Rails.application.routes.url_helpers.rails_blob_path(@document.file, only_path: true)

    respond_to do |format|
      if @document.save
        format.html { render :index, notice: 'Document successfully saved!'}
      else
        puts @document.errors.full_messages
        format.html { render :new, notice: "WHAT THE FUCK" }
      end
    end
  end

  protected
  def document_params
    params.require(:document).permit(:status, :file, :file_path)
  end
end
