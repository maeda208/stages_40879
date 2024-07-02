class Apply < ApplicationRecord
  belongs_to :user
  belongs_to :stage
  has_many :comments 
end
