module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :login, mutation: Mutations::Login
    field :create_document, mutation: Mutations::CreateDocument
    field :delete_document, mutation: Mutations::DeleteDocument
    field :update_user, mutation: Mutations::UpdateUser
  end
end
