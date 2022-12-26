class Submit < ApplicationRecord

  validates :title, presence: true,length: { minimum: 1, maximum: 20 }
  validates :content, presence: true,length: { minimum: 1, maximum: 100 }
  validates :image, presence: true

  has_many :comments, dependent: :destroy
  has_one_attached :image
  belongs_to :user

  is_impressionable counter_cache: true
end