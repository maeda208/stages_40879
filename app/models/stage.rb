class Stage < ApplicationRecord
  belongs_to :user
  validates :reward, presence: true
  validates :title, presence: true
  validates :month, presence: true
  validates :day, presence: true
  validates :show_hour, presence: true
  validates :show_minute, presence: true
  validates :end_hour, presence: true
  validates :end_minute, presence: true
  validates :theater, presence: true
  validates :address, presence: true
  validates :conditions, presence: true
end
