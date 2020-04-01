module Types
  class DocumentType < BaseObject
    field :id, ID, null: false
    field :user, Types::UserType, null: false
    field :status, Integer, null: false
    field :file_path, String, null: false
    field :created_at, String, null: false
    field :updated_at, String, null: false
    field :recipient, [RecipientType], null: false
    field :file, Types::FileType, null: false


  end
end