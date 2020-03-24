class CreateDocumentEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :document_events do |t|
      t.string :message
      t.references :document, null: false, foreign_key: true

      t.timestamps
    end
  end
end
