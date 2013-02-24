require 'spec_helper'

describe User do

  describe "validation of new" do

    it "fails without password" do
      should have(1).error_on(:password)
    end

    it "pass with password" do
      subject.password ="blahpw"
      should have(0).error_on(:password)
    end

    it "fails without email" do 
      should have(1).error_on(:email)
    end 
    it "pass with email" do
      subject.email ="blah@blah.com"
      should have(0).error_on(:email)
    end


  end
end

