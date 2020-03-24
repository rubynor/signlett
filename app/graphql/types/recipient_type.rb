module Types
  class RecipientType < BaseObject
    field :id, ID, null: false
    field :document, DocumentType, null: false
    field :signed, Boolean, null: false
    field :email, String, null: false
    field :created_at, String, null:false
    field :updated_at, String, null:false
  end
end