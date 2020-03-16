module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :login, mutation: Mutations::Login
    field :create_document, mutation: Mutations::CreateDocument
  end
end
