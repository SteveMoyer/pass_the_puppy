require 'spec_helper'

describe Puppy do
  let(:user){ User.new :email =>'test@test.com'}
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

end