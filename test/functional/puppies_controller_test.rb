require 'test_helper'

class PuppiesControllerTest < ActionController::TestCase
  test "non admin can take puppy that is available" do
    put :take, {:id => puppies(:availdog).id}, {:user_id => users(:other).id}
    assert_response :success
    assert_equal 'You have taken the puppy', flash[:notice]
  end

  test "cannot take puppy that is not available" do
    put :take, {:id => puppies(:stevesdog).id}, {:user_id => users(:other).id}
    assert_response :success
    assert_equal 'The puppy is not available', flash[:alert]
  end

  test "non-admin cannot leave puppy that is not theirs" do
    post :leave, {:id => puppies(:stevesdog).id}, {:user_id => users(:other).id}
    assert_response :success
    assert_equal 'To leave the puppy you must have the puppy.  If you think the puppy is lost contact an admin', flash[:alert]
  end

  test "non-admin can leave puppy that is theirs" do
    post :leave, {:id => puppies(:otherdog).id}, {:user_id => users(:other).id}
    assert_response :success
    assert_equal 'You returned the puppy.', flash[:notice]
  end

  test "admin can leave puppy that is not theirs" do
    post :leave, {:id => puppies(:otherdog).id}, {:user_id => users(:steve).id}
    assert_response :success
    assert_equal 'You returned the puppy.', flash[:notice]
  end

  test "create should render show when no errors" do
    post :create,{:puppy=> {:name=>"bluto"}},{:user_id=> users(:steve).id}
    assert_redirected_to puppy_path(assigns(:puppy))
  end

  test "create should render new when  errors" do
    post :create,{:puppy=> {}},{:user_id=> users(:steve).id}
    assert :success
  end

  test "new assigns puppy" do
    get :new 
    assert_response :success
    assert_not_nil assigns(:puppy)
  end

  test "index should assign puppies and respond with html" do
    get :index 
    assert_response :success
    assert_not_nil assigns(:puppies)
  end 
  test "show should assign puppy and respond with html" do
    get :show, {:id => puppies(:stevesdog).id }
    assert_response :success
    assert_not_nil assigns(:puppy)
  end 



end
