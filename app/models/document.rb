class Document < ApplicationRecord
  belongs_to :user
  has_many :recipient, dependent: :destroy

  has_many_attached :file, dependent: :purge_later

end
