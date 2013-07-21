class TaskMailer < ActionMailer::Base
    default from: "notifications@example.com"

    def request_submit_email(member)
        @member = member
        mail(to: member.email, subject: "Please submit your work")
    end

    def weekly_log_email(member, group)
        @member = member
        @group = group

        @daily_logs = DailyLog.where ("member_id = ? and created_at > Time.now.begining_of_week and created_at < (Time.now.begining_of_week + 5.days)" )

        mail(to: member.email, subject: "Your Week Log")
    end

    def receive(email)
        member = Member.find_by_email(email.from.first)
        return if member.nil?

        if email.multipart?
            member.daily_logs.create(
                subject: email.subject,
                content: email.html_part.body.decoded
            )
        else
            member.daily_logs.create(
                subject: email.subject,
                content: email.body.decoded
            )
        end
    end
end