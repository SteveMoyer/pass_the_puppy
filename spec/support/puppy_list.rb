require_relative 'base_page'
require 'capybara/rspec'
class PuppyList
  include BasePage
  include Capybara::DSL
  include RSpec::Matchers
  def view_puppy(puppy)
    click_link puppy.name
  end
  def goto_new_puppy
    click_link "Create a new puppy"
  end
  def verify_contains_puppy! (name)
     find_link(name)
  end

end
