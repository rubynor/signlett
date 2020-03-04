module Types
  class DocumentType < BaseObject
    field :id, ID, null: false
    field :user, Types::UserType, null: false
    field :status, Integer, null: false
    field :file_path, String, null: false
  end
end