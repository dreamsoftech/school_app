class TaskMailer < ActionMailer::Base
    default from: "notifications@example.com"

    def request_submit_email(member)
        @member = member
        mail(to: member.email, subject: "Please submit your work")
    end

    def weekly_log_email(member, group)
        @member = member
        @group = group
        puts @member
        puts @group
        mail(to: member.email, subject: "Your Week Log")
    end

    def receive(email)
        # member = Member.find_by_email(email.to.first)
        # return if member.nil?
        # member.daily_logs.create(
        #     subject: email.subject,
        #     content: email.body
        # )
        logger.debug "Received the email from " + email.to.first
        
        # if email.has_attachments?
        #     email.attachments.each do |attachment|
        #         page.attachments.create({
        #         file: attachment,
        #         description: email.subject
        #     })
        #     end
        # end
    end

end