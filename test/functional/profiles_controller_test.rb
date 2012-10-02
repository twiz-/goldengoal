require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:tony).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end
  
  test "no profile name should render a 404 page" do
    get :show, id: "doesn't exist"
    assert_response :not_found
  end
  
  test "that variables are assigned on successful profile viewing" do
    get :show, id: users(:tony).profile_name
    assert assigns(:user)
    assert_not_empty assigns(:players)
  end
  
  test "only shows the correct user's players" do
    get :show, id: users(:tony).profile_name
    assigns(:players).each do |player|
      assert_equal users(:tony), player.user
    end
  end
end
