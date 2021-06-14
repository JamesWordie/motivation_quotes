class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_quotes
  has_many :quotes, through: :user_quotes

  validates :firstname, presence: true
  validates :lastname, presence: true
end
