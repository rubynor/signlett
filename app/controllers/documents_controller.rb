class DocumentsController < ApplicationController
  def index
    @documents = Document.find_by_user_id(current_user)
  end

  def show
    @document = Document.find(params[:id])
  end

  def create
  end
end
