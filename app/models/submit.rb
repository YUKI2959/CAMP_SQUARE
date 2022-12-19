class Submit < ApplicationRecord

  validates :title, presence: true
  validates :content, presence: true
  validates :image, presence: true


  has_one_attached :image
  belongs_to :user
end