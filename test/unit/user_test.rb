require 'test_helper'

class UserTest <ActiveSupport::TestCase
  test "should not save without password" do
	user =User.new
	assert !user.save
  end

  test "should save with password" do
	user =User.new
        user.password ="blah"
	assert user.save
  end

end

