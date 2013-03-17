require 'spec_helper'
require 'capybara/rspec'

describe "managing an organization" do
  context "when signed in as an admin" do
    let(:login_page){LoginPage.new}
    let(:puppy_list){PuppyList.new}
    let(:puppy_view){PuppyView.new}
    let(:new_puppy){NewPuppy.new}
    it 'user should be able to join organization' do
#      @user =FactoryGirl.create(:user)
#      login_page.login_as(@user.email,"password")
#      puppy_list.click_join_organization
#      edit_organization_view.join_organization 'acme','acmepass'

    end
  end
end
