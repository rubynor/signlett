# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Document queries
    field :find_all_documents, [DocumentType], null: false do
      description "Find all documents in DB"
    end

    field :document_for_user, [DocumentType], null: true do
      description "Find documents belonging to current user if there is any"
    end

    field :recipient_for_document, [RecipientType], null: true do
      description "Find recipients for given document"
    end

    # User queries
    field :find_user, UserType, null: false do
      description "Find user by ID"
      argument :id, ID, required: true
    end

    field :users, [UserType], null: false do
      description "Find all users"
    end

    field :user_logged_in, UserType, null: false do
      description "Get current logged in user"
    end

    def users
      User.all
    end

    def find_all_documents
      Document.all
    end

    def find_user(id:)
      User.find(id)
    end

    def user_logged_in
      context[:current_user]
    end

    def document_for_user
      currUser = context[:current_user]
      Document.where(user_id: currUser.id)
    end

    def recipient_for_document
      currUser = context[:current_user]
      documents = Document.where(user_id: currUser.id)
      Recipient.where(document_id: documents.ids)
    end

  end
end
