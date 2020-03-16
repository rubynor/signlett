class CreateRecipients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipients do |t|
      t.references :document, null: false, foreign_key: true
      t.boolean :signed, default: false
      t.string :email

      t.timestamps
    end
  end
end
