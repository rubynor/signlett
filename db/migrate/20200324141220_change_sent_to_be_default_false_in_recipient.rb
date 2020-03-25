class ChangeSentToBeDefaultFalseInRecipient < ActiveRecord::Migration[6.0]
  def change
    change_column_default :recipients, :sent, from: true, to: false
  end
end
