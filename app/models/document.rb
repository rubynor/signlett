class Document < ApplicationRecord
  belongs_to :user
  has_many :recipient, dependent: :destroy

  has_one_attached :file, dependent: :purge_later

end
