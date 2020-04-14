class Recipient < ApplicationRecord
  belongs_to :document

  def self.find_first document
    self.where(document: document, sent: false).first
  end

  def set_sent_true
    update! sent: true
  end
end
