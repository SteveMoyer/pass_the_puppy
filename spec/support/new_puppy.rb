require 'capybara/rspec'
class NewPuppy
  include Capybara::DSL
  def create_puppy (name)
    fill_in :puppy_name, :with =>name
    click_button "Create puppy"
  end
end
