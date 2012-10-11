require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  def setup 
    @user = users(:tony)
  end

  test "should get show" do
    sign_in @user
    get :show, id: users(:tony).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end
  
  test "no profile name should render a 404 page" do
    pending 'this actually sends to login right now'
    get :show, id: "doesn't exist"
    assert_response :not_found
  end
  
  test "that variables are assigned on successful profile viewing" do
    sign_in @user
    get :show, id: users(:tony).profile_name
    assert assigns(:user)
    assert_not_empty assigns(:players)
  end
  
  test "only shows the correct user's players" do
    sign_in @user
    get :show, id: users(:tony).profile_name
    assigns(:players).each do |player|
      assert_equal users(:tony), player.user
    end
  end
end
