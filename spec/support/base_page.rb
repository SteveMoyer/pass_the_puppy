require 'capybara/rspec'
module BasePage
  include Capybara::DSL
  def return_to_puppy_list
    click_link('Return to Puppy List')
  end
end
