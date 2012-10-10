require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  setup do
    @user = users(:tony)
    @note = notes(:one)
  end

  test "should get index" do
    sign_in @user
    get :index, user_id: @user.to_param
    assert_response :success
    assert_not_nil assigns(:notes)
  end

  test "should be redirected when not logged in" do
    get :new, user_id: @user.to_param
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end
  
  test "should render the new page when logs in" do
    sign_in users(:tony)
    get :new, user_id: @user.to_param
    assert_response :success
  end
  
  test "should be logged in to post a status" do
    post :create, status: { comment: "Hello"}, user_id: @user.to_param
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create note when logged in " do
    sign_in users(:tony)
    
    assert_difference('Note.count') do
      post :create, note: { comments: @note.comments, practice: @note.practice }, user_id: @user.to_param
    end

    assert_redirected_to user_note_path(@user, assigns(:note))
  end

  test "should show note" do
    sign_in users(:tony)
    get :show, id: @note, user_id: @user.to_param
    assert_response :success
  end

  test "should get edit when logged in" do
    sign_in users(:tony)
    get :edit, id: @note, user_id: @user.to_param
    assert_response :success
  end
  
  test "should redirect note user when not logged in" do
    put :update, id: @note, note: { comments: @note.comments, practice: @note.practice }, user_id: @user.to_param
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should update note when logged in" do
    sign_in users(:tony)
    put :update, id: @note, note: { comments: @note.comments, practice: @note.practice }, 
      user_id: @user.to_param
    assert_redirected_to user_note_path(@user, assigns(:note))
  end

  test "should destroy note" do
    sign_in @user
    assert_difference('Note.count', -1) do
      delete :destroy, id: @note, user_id: @user.to_param
    end

    assert_redirected_to user_notes_path(@user)
  end
end
