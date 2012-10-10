require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  setup do
    @user = users(:tony)
    @player = players(:one)
  end

  test "should get index" do
    sign_in @user
    get :index, :user_id => @user.profile_name
    assert_response :success
    assert_not_nil assigns(:players)
  end

  test "should be redirected when not logged in" do
    get :new, :user_id => @user.profile_name
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end
  
  test "should render the new page when logged in" do
    sign_in @user
    get :new, user_id: @user.profile_name
    assert_response :success 
  end
  
  test "should be logged in to post a new player" do
    post :create, player: { player_name: "Tony Ramirez" }, user_id: @user.profile_name
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create player when logged in" do
    sign_in @user
    assert_difference('Player.count') do
      post :create, player: { player_name: @player.player_name }, user_id: @user.profile_name
    end

    assert_redirected_to user_player_path(@user, assigns(:player))
  end

  test "should show player" do
    sign_in @user
    get :show, id: @player, user_id: @user.profile_name
    assert_response :success
  end
  
  test "should redirect player edit only when logged in" do    
    pending "I'm not sure what's the meaning of this"
    sign_in @user
    get :edit, id: @player, user_id: @user.profile_name
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should get edit when logged in" do
    sign_in users(:tony)
    get :edit, id: @player, user_id: @user.profile_name
    assert_response :success
  end
  
  test "should redirect player update when not logged in" do
    put :update, id: @player, player: { player_name: @player.player_name }, 
      user_id: @user.profile_name
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should update player when logged in" do
    sign_in @user
    put :update, id: @player, player: { player_name: @player.player_name }, 
      user_id: @user.profile_name
    assert_redirected_to [@user, assigns(:player)]
  end

  test "should not mass assign the user" do 
    sign_in @user
    assert_raise  ActiveModel::MassAssignmentSecurity::Error do 
      put :update, id: @player,
        player: { player_name: @player.player_name, user_id: users(:james).id }, 
        user_id: @user.profile_name
    end
  end

  test "should destroy player" do
    sign_in @user
    assert_difference('Player.count', -1) do
      delete :destroy, id: @player, user_id: @user.profile_name
    end

    assert_redirected_to user_players_path(@user)
  end
end
