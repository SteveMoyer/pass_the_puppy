require 'spec_helper'

describe PuppyHistory do

  describe "user_email" do
    it "returns nil when no user" do
      subject.user_email.should be_nil
    end
    it "returns users email when there is a user" do
      subject.user= FactoryGirl.create(:admin)
      subject.user_email.should ==subject.user.email
    end
  end
end
