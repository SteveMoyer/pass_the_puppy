require 'capybara/rspec'
class LoginPage
  include Capybara::DSL
  def login_as (email,password) 
    visit '/'
    fill_in 'user_email', :with => email
    fill_in 'user_password', :with => password
    click_button 'Sign in'
  end   


end
