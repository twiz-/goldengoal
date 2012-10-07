require 'test_helper'

class LogisticsControllerTest < ActionController::TestCase
  setup do
    @logistic = logistics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:logistics)
  end

  test "should be redirected when not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end
  
  test "Should render the new page when logged in" do
    sign_in users(:tony)
    get :new
    assert_response :success  
  end
  
  test "should be logged in to post a status" do
    post :create, logistic: { content: "Hello"}
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create logistic when logged in" do
    sign_in users(:tony)
    
    assert_difference('Logistic.count') do
      post :create, logistic: { content: @logistic.content }
    end

    assert_redirected_to logistic_path(assigns(:logistic))
  end

  test "should show logistic" do
    get :show, id: @logistic
    assert_response :success
  end
  
  test "should redirect logistic edit when not logged in" do
    get :edit, id: @logistic
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should get edit when logged in" do
    sign_in users(:tony)
    get :edit, id: @logistic
    assert_response :success
  end
    
  test "should redirect logistic update when not logged in" do
    put :update, id: @logistic, logistic: { content: @logistic.content }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should update logistic when logged in" do
    sign_in users(:tony)
    put :update, id: @logistic, logistic: { content: @logistic.content }
    assert_redirected_to logistic_path(assigns(:logistic))
  end

  test "should destroy logistic" do
    assert_difference('Logistic.count', -1) do
      delete :destroy, id: @logistic
    end

    assert_redirected_to logistics_path
  end
end
