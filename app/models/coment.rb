class Coment < ApplicationRecord

  belongs_to :user
  belongs_to :submit

  validates :coment, presence: true

end
