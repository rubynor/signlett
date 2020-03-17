module Types
  class FileType < BaseObject
    field :filename, String, null: false
    field :content_type, String, null:false
    field :byte_size, Int, null: false

  end
end