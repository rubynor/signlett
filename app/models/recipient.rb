class Recipient < ApplicationRecord
  belongs_to :document, dependent: :destroy
end
