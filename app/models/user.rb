class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
    # presence: true 空を許可しない
    validates :nickname, presence: true
    validates :profile, presence: true

    has_many :submits, dependent: :destroy
    has_many :coments, dependent: :destroy
end