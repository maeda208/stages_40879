class Stage < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :show_hour
  belongs_to :show_minute
  belongs_to :end_hour
  belongs_to :end_minute
  validates :reward, presence: true
  validates :title, presence: true
  validates :month_id, presence: true
  validates :day_id, presence: true
  validates :show_hour_id, presence: true
  validates :end_hour_id, presence: true
  validates :theater, presence: true
  validates :address, presence: true
  validates :conditions, presence: true
end
