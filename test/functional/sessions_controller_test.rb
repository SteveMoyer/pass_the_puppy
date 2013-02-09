require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should authenticate user and redirect to root" do
    put :create, {:email=>"bruinseve@ptp.com",:password=>"ptp"}
    assert_redirected_to root_url
    assert_equal "Logged in!", flash[:notice]
  end
  test "should reject login with bad password" do
    put :create, {:email=>"bruinseve@ptp.com",:password=>"ptp2"}
    assert_response :success
    assert_equal "Invalid email or password", flash[:alert]
  end
  test "should destroy session" do
    put :destroy,{},{:user_id=>users(:steve).id}
    assert_redirected_to root_url
    assert_nil session[:user_id]
  end


end

