class DailyLog < ActiveRecord::Base
	attr_accessible :subject, :content
  belongs_to :member

  def self.receive_email
  	TaskMailer.receive(STDIN.read)
  end
end