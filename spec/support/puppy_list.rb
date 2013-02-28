require 'capybara/rspec'
class PuppyList
  include Capybara::DSL
  def view_puppy(puppy)
    click_link puppy.name
  end
end
