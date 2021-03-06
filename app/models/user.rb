class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  attachment :image

  validates :name, presence: true, uniqueness: true,
                   length: { minimum: 3, maximum: 20 }
  validates :profile, length: { maximum: 50 }



end
