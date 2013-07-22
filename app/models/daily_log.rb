class DailyLog < ActiveRecord::Base
	attr_accessible :subject, :content
  belongs_to :member

end