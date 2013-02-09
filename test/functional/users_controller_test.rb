require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:user)
  end

  test "should redirect to root on successful registration" do
    put :create, {:user => {:email=> "new@blah.com", :password=>"blah", :password_confirmation => "blah"}}
    assert_redirected_to root_url
  end 
  test "should render new if errors with registration" do
    put :create, {:user => {:email=> "new@blah.com", :password=>"blah", :password_confirmation => "b"}}
    assert_response :success
    assert_template :new
  end 

  test "should redirect to change password on password changed" do
    post :change_password, {:password => {:old_password=>"ptp", :new_password=>"ptp2", :new_password_confirmation=>"ptp2"}}, {:user_id=> users(:steve)}
    assert_equal "Your password has been changed", flash[:notice]
    assert_redirected_to :change_password
  end

  test "should display error if password is invalid" do
    post :change_password, {:password => {:old_password=>"ptp22"}}, {:user_id=> users(:steve)}
    assert_equal "Invalid password", flash[:error]
    assert_response :success
  end

  test "should display error if passwords don't match" do
    post :change_password, {:password => {:old_password=>"ptp", :new_password=>"ptp2", :new_password_confirmation=>"ptp2wrong"}}, {:user_id=> users(:steve)}
    assert_equal "Unable to change your password", flash[:error]
    assert_response :success
  end

end
