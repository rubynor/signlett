class Document < ApplicationRecord

  default_scope { order(created_at: :asc)}

  belongs_to :user

  has_secure_token :email_token

  has_many :recipient, dependent: :destroy
  has_many :document_events, dependent: :destroy

  has_one_attached :file, dependent: :purge_later

  def file_path
    file.service_url
  end
end
