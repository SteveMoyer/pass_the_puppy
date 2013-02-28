require'spec_helper'
describe PuppiesController do
  include Devise::TestHelpers

  context "admin is signed in" do
    let (:current_user) {FactoryGirl.create(:admin) }

    before :each do
      sign_in current_user
      controller.stub(:current_user).and_return(current_user)
    end
    describe :leave do
      it "succeeds when they are not the owner" do
        post :leave, {:id => 
          FactoryGirl.create(:puppy, :owner=> FactoryGirl.create( :user))         }
          response.should be_success
          flash[:notice].should == 'You returned the puppy.'
      end
    end
  end

  context "non-admin is signed in" do
    let (:current_user) { FactoryGirl.create(:user) }
    before :each do
      sign_in current_user
      controller.stub(:current_user).and_return(current_user)
    end

    describe :take do
      it "it succeeds when available" do
        get :take, {:id=>FactoryGirl.create(:puppy).id}
        response.should be_success
        flash[:notice].should == "You have taken the puppy"
      end

      it "fails when not available" do
        get :take, {:id=>FactoryGirl.create(:puppy, :owner=>FactoryGirl.create(:admin)).id}
        flash[:alert].should == 'The puppy is not available'
      end
    end
    describe :leave do 
      it "succeeds when they are the owner" do
        post :leave, {:id => FactoryGirl.create(:puppy, :owner=>current_user).id}
        response.should be_success
        flash[:notice].should == 'You returned the puppy.'
      end

      it "fails when they are not the owner" do
        post :leave, {:id => FactoryGirl.create(:puppy).id}
        response.should be_success
        flash[:alert].should == 'To leave the puppy you must have the puppy.  If you think the puppy is lost contact an admin'
      end
    end

    describe :create do
      it "renders show when no errors" do
        post :create,{:puppy=> {:name=>"bluto"}}
        assert_redirected_to puppy_path(assigns(:puppy))
      end

      it "renders new when  errors" do
        post :create,{:puppy=> {}}
        assert :success
      end
    end

    describe :new do
      it "assigns puppy" do
        get :new 
        assert_response :success
        assert_not_nil assigns(:puppy)
      end
    end

    describe :index do
      it "assigns puppies and responds with html" do
        get :index 
        assert_response :success
        assert_not_nil assigns(:puppies)
      end 
    end

    describe :show do
      it "assigns puppy and responds with html" do
        get :show, {:id => FactoryGirl.create(:puppy).id }
        assert_response :success
        assert_not_nil assigns(:puppy)
      end 
    end
  end
end
