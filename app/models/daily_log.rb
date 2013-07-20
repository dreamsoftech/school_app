class DailyLog < ActiveRecord::Base
	attr_accessible :subject, :content
  belongs_to :member


	def self.receive_email
		logger.debug "----------------------------------------------------------------------"
		TaskMailer.receive(STDIN)
	end
end