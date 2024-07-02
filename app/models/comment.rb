class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :stage
  belongs_to :apply
end
