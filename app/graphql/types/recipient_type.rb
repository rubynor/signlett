module Types
  class RecipientType < BaseObject
    field :id, ID, null: false
    field :document, DocumentType, null: false
    field :signed, Boolean, null: false
    field :email, String, null: false
  end
end