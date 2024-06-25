class User < ApplicationRecord
has_many :stages
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
