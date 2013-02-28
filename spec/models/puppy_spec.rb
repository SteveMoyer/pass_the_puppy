require 'spec_helper'

describe Puppy do
  let(:user){FactoryGirl.create (:user) }
  let(:admin) {FactoryGirl.create(:admin)}

  describe "validation of new" do
    it "fails without a name" do
      should have(1).error_on (:name)
    end
    it "passes with a valid name" do
      subject.name="sara"
      should have(0).error_on (:name)
    end

  end

  context "when taken" do
    it "sets user and time" do
      subject.take user
      subject.owner.should == user
      subject.taken_time.should_not be_nil
    end 
  end

  context "when left" do 
    it "removes owner and comment and adds history" do
      subject.owner = user
      subject.comments ="blah"

      subject.leave user, "comment"

      subject.owner.should be_nil
      subject.comments.should be_nil
      subject.puppy_history.size.should == 1
    end 
  end

  it "should include owner email in json" do
    subject.owner=user
    json = subject.as_json()
    json[:owner]["email"].should == user.email
  end 

  describe "status" do
    it "returns available when there is no owner" do
      subject.status.should include("available")
    end
    it "returns you have the puppy when you are the owner" do
      subject.owner =admin
      subject.status(admin).should include("You have")
    end
    it "returns owner has the puppy when someone else owns it" do
      subject.owner =admin
      subject.status(user).should include("has")
    end   
  end
end
