class DocumentsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  def index
    @documents = Document.find_by_user_id(current_user)
  end

  def show
    @document = Document.find(params[:id])
  end

  def create
  end
end
