class Member < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email
	validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  belongs_to :group
  has_many :daily_logs
end