class Stage < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :show_hour
  belongs_to :show_minute
  belongs_to :end_hour
  belongs_to :end_minute
  belongs_to :month
  belongs_to :day
  has_many :applies
  has_many :applies, dependent: :destroy
  has_many :applicants, through: :applies, source: :user
  has_many :comments
  validates :reward, presence: true
  validates :title, presence: true
  validates :month_id, presence: true
  validates :day_id, presence: true
  validates :show_hour_id, presence: true
  validates :end_hour_id, presence: true
  validates :theater, presence: true
  validates :address, presence: true
  validates :conditions, presence: true
  def start_time
      created_at
    end
end
