require 'spec_helper'
require 'capybara/rspec'

describe "the checkout process" do
  self.use_transactional_fixtures = false
  context "when signed in as a non-admin" do
    it 'should check out the puppy to me' do
      @puppy=FactoryGirl.create(:puppy)
      @user =FactoryGirl.create(:user)
      LoginPage.new.login_as(@user.email,"password")
      PuppyList.new.view_puppy @puppy
      PuppyView.new.take_puppy 'taking'
      PuppyView.new.verify_i_have_the_puppy
    end
  end
end
