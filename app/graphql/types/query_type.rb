# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject

    field :find_user, UserType, null: false do
      description "Find user by ID"
      argument :id, ID, required: true
    end

    field :documents, [DocumentType], null: false do
      description "Find all documents in DB"
    end

    def documents
      Document.all
    end

    def find_user(id:)
      User.find(id)
    end
  end
end
