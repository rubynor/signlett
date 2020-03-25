class AddSentToRecipients < ActiveRecord::Migration[6.0]
  def change
    add_column :recipients, :sent, :boolean
  end
end
