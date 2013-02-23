require 'test_helper'

class UserTest <ActiveSupport::TestCase
  test "should not save without password" do
    user =User.new
    user.email="blah@blah.com"
    assert_false user.save
  end

  test "should save with password" do
    user =User.new
    user.password ="blahpw"
    user.email="blah@blah.com"
    assert_true user.save
  end

  test "should not save without email" do 
    user =User.new
    user.password="blah"
    assert_false user.save
  end 
end

