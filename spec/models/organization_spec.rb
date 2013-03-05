require 'spec_helper'

describe Organization do

  describe "validation of new" do
    it "fails without a name" do
      should have(1).error_on (:name)
    end
    it "passes with a valid name" do
      subject.name="acme"
      should have(0).error_on (:name)
    end

  end
end


