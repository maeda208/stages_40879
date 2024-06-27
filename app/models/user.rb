class User < ApplicationRecord
  has_many :stages
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phonenumber, presence: true
end
