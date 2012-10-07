require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  setup do
    @player = players(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:players)
  end

  test "should be redirected when not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end
  
  test "should render the new page when logged in" do
    sign_in users(:tony)
    get :new
    assert_response :success 
  end
  
  test "should be logged in to post a new player" do
    post :create, player: { player_name: "Tony Ramirez" }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create player when logged in" do
    sign_in users(:tony)
    
    assert_difference('Player.count') do
      post :create, player: { player_name: @player.player_name }
    end

    assert_redirected_to player_path(assigns(:player))
  end

  test "should show player" do
    get :show, id: @player
    assert_response :success
  end
  
  test "should redirect player edit only when logged in" do    
    get :edit, id: @player
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should get edit when logged in" do
    sign_in users(:tony)
    get :edit, id: @player
    assert_response :success
  end
  
  test "should redirect player update when not logged in" do
    put :update, id: @player, player: { player_name: @player.player_name }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should update player when logged in" do
    sign_in users(:tony)
    put :update, id: @player, player: { player_name: @player.player_name }
    assert_redirected_to player_path(assigns(:player))
  end

  test "should destroy player" do
    assert_difference('Player.count', -1) do
      delete :destroy, id: @player
    end

    assert_redirected_to players_path
  end
end
