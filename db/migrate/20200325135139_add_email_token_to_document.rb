class AddEmailTokenToDocument < ActiveRecord::Migration[6.0]
  def change
    add_column :documents, :email_token, :string
    add_index :documents, :email_token, unique: true
  end
end
