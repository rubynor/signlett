module Types
  class DocumentEventType < BaseObject
    field :id, ID, null: false
    field :document, Types::DocumentType, null: false
    field :message, String, null: false
    field :created_at, String, null: false
    field :updated_at, String, null: false
  end
end