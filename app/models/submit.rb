class Submit < ApplicationRecord

  validates :title, presence: true
  validates :content, presence: true
  validates :image, presence: true

  has_many :comments, dependent: :destroy
  has_one_attached :image
  belongs_to :user

  is_impressionable counter_cache: true
end