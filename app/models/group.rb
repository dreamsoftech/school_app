class Group < ActiveRecord::Base
  attr_accessible :name, :timezone, :description

  has_many :members

  # wheneverize
  def self.daily_reminder
    groups = Group.all
    groups.each do |g|
    	Time.zone = g.timezone

      cur_time = Time.now.in_time_zone(g.timezone)
      logger.debug(Time.now.in_time_zone(g.timezone))

      if !g.members.empty?
    		members = g.members
    		members.each do |m|
          next if m.daily_logs.empty?
          TaskMailer.weekly_log_email(m, g).deliver
          if cur_time.wday == 5 and cur_time.hour == 17 # Friday 5:00PM
            TaskMailer.weekly_log_email(m, g).deliver
          elseif cur_time.hour == 16 and cur_time.wday < 5 and cur_time.wday > 0 # Monday ~ Thursday 4:00PM
            time_range = Time.now.beginning_of_day..(Time.now.beginning_of_day + 1.day)
            daily_logs = m.daily_logs.where(daily_logs: {created_at: time_range})
            next if !daily_logs.empty? # if member submitted already, don't send the request msg.
            TaskMailer.request_submit_email(m).deliver
  		    end
  	    end
      end
    end
  end
end