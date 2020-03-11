class DocumentsController < ApplicationController

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
    @document = Document.new(document_params)
    @document.user_id = current_user.id

    respond_to do |format|
      if @document.save
        @document.update!(file_path: rails_blob_path(@document.file, disposition: 'preview')
        )
        format.json { render json: @document }
        format.js { render json: @document }
      else
        puts @document.errors.full_messages
        format.json { render json: @document.errors }
        format.js { render json: @document.errors }
      end
    end
  end

  protected
  def document_params
    params.require(:document).permit(:status, :file_path, :file)
  end
end
