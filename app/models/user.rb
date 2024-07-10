class User < ApplicationRecord
  after_initialize :set_default_values
  before_save :calculate_age
  has_many :applies
  has_many :owned_stages, class_name: 'Stage' 
  has_many :applied_stages, through: :applies, source: :stage 
  has_many :comments
  attr_accessor :token
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phonenumber, presence: true
  validates :birth_date, presence: true
  validates :gender, inclusion: { in: %w[male female other], message: "%{value} is not a valid gender" }

end

private
def set_default_values
  self.money ||= 0
end

  def calculate_age
    return unless birth_date.present?

    today = Date.today
    self.age = today.year - birth_date.year - ((today.month > birth_date.month || (today.month == birth_date.month && today.day >= birth_date.day)) ? 0 : 1)
  end
