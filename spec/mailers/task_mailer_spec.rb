require "spec_helper"

describe TaskMailer do
  describe '#request_submit_email' do
    let(:user) { FactoryGirl.create(:user) }
    let(:mail) { TaskMailer.request_submit_email(user) }

    it "has the correct user email" do
      mail.to.should == [user.email]
    end

    it "has the correct senders email" do
      mail.from.should == ["notifications@example.com"]
    end

    it "has the correct subject" do
      mail.subject.should == "Please submit your work"
    end

  end
end
