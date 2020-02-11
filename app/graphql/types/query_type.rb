# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject

    field :find_user, UserType, null: false do
      description "Find user by ID"
      argument :id, ID, required: true
    end

    def find_user(id:)
      User.find(id)
    end
  end
end
