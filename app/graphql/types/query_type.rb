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

    field :user_as_recipient, [RecipientType], null: true do
      description "Return all documents sent to current_user"
    end

    # Event queries

    field :event_for_document, [DocumentEventType], null: false do
      description "Find all events by document"
      argument :document_id, ID, required: true
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
      current_user
    end

    def document_for_user
      current_user.documents
    end

    def user_as_recipient
      Recipient.where(email: current_user.email)
    end

    def event_for_document(document_id:)
      DocumentEvent.where(document_id: document_id)
    end


  end
end
