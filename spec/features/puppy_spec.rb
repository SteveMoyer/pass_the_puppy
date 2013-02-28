require 'spec_helper'
require 'capybara/rspec'

describe "the checkout process", :js=>true do
  before :each do
    User.create( :email=>'user@test.com',:password=>'testpass')
  end

  context "when signed in as a non-admin" do
    before :each do
      visit '/'
      fill_in 'user_email', :with => users(:other).email
      fill_in 'user_password', :with => users(:other).password
      sleep 5000
      click_button 'Sign in'
    end
    it 'should check out the puppy to me' do
      click_link 'fido'
      fill_in 'puppy_comments', :with => 'taking'
      click_button 'take the puppy'

    end
  end
end
