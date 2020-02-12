module Types
  class DocumentType < BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :status, Integer, null: false
    field :file_path, String, null: false
  end
end