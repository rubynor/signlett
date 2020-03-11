class Document < ApplicationRecord
  belongs_to :user
  has_many :recipients

  has_one_attached :file

end
