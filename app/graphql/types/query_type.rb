# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject

    field :find_user, UserType, null: false do
      description "Find user by ID"
      argument :id, ID, required: true
    end

    field :find_all_documents, [DocumentType], null: false do
      description "Find all documents in DB"
    end

    field :users, [UserType], null: false do
      description "Find all users"
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
  end
end
