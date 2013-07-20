class TaskMailer < ActionMailer::Base
    default from: "notifications@example.com"

    def request_submit_email(member)
        @member = member
        mail(to: member.email, subject: "Please submit your work")
    end

    def weekly_log_email(member, group)
        @member = member
        @group = group
        mail(to: member.email, subject: "Your Week Log")
    end

    def receive(email)
        member = Member.find_by_email(email.from.first)
        # return if member.empty?
        member.daily_logs.create(
            subject: email.subject,
            content: email.body
        )
    end

end