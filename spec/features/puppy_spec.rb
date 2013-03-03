require 'spec_helper'
require 'capybara/rspec'

describe "the checkout process" do
  context "when signed in as a non-admin", :js=>true  do
    let(:login_page){LoginPage.new}
    let(:puppy_list){PuppyList.new}
    let(:puppy_view){PuppyView.new}
    let(:new_puppy){NewPuppy.new}
    it 'should check out the puppy to me' do
      @puppy=FactoryGirl.create(:puppy)
      @user =FactoryGirl.create(:user)
      login_page.login_as(@user.email,"password")
      puppy_list.view_puppy @puppy
      puppy_view.take_puppy 'taking'
      puppy_view.verify_i_have_the_puppy
    end
    it 'creates a new puppy' do
      @user =FactoryGirl.create(:user)
      login_page.login_as(@user.email,"password")
      puppy_list.goto_new_puppy
      new_puppy.create_puppy "bowser"
      puppy_view.return_to_puppy_list
      puppy_list.verify_contains_puppy! "bowser"
    end
  end
end
