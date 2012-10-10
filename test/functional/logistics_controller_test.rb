require 'test_helper'

class LogisticsControllerTest < ActionController::TestCase
  setup do
    @user = users(:tony)
    @logistic = logistics(:one)
  end

  test "should get index" do
    sign_in @user
    get :index, user_id: @user.to_param
    assert_response :success
    assert_not_nil assigns(:logistics)
  end

  test "should be redirected when not logged in" do
    get :new, user_id: @user.to_param
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end
  
  test "Should render the new page when logged in" do
    sign_in users(:tony)
    get :new, user_id: @user.to_param
    assert_response :success  
  end
  
  test "should be logged in to post a status" do
    post :create, logistic: { content: "Hello"}, user_id: @user.to_param
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create logistic when logged in" do
    sign_in @user
    
    assert_difference('Logistic.count') do
      post :create, logistic: { content: @logistic.content }, user_id: @user.to_param
    end

    assert_redirected_to user_logistic_path(@user, assigns(:logistic))
  end

  test "should show logistic" do
    sign_in @user
    get :show, id: @logistic, user_id: @user.to_param
    assert_response :success
  end
  
  test "should redirect logistic edit when not logged in" do
    get :edit, id: @logistic, user_id: @user.to_param
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should get edit when logged in" do
    sign_in users(:tony)
    get :edit, id: @logistic, user_id: @user.to_param
    assert_response :success
  end
    
  test "should redirect logistic update when not logged in" do
    put :update, id: @logistic, logistic: { content: @logistic.content }, user_id: @user.to_param
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should update logistic when logged in" do
    sign_in @user
    put :update, id: @logistic, logistic: { content: @logistic.content }, user_id: @user.to_param
    assert_redirected_to user_logistic_path(@user, assigns(:logistic))
  end

  test "should destroy logistic" do
    sign_in @user
    assert_difference('Logistic.count', -1) do
      delete :destroy, id: @logistic, user_id: @user.to_param
    end

    assert_redirected_to user_logistics_path(@user)
  end
end
