require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  setup do
    @note = notes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notes)
  end

  test "should be redirected when not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end
  
  test "should render the new page when logges in" do
    sign_in users(:tony)
    get :new
    assert_response :success
  end

  test "should create note" do
    assert_difference('Note.count') do
      post :create, note: { comments: @note.comments, practice: @note.practice }
    end

    assert_redirected_to note_path(assigns(:note))
  end

  test "should show note" do
    get :show, id: @note
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @note
    assert_response :success
  end

  test "should update note" do
    put :update, id: @note, note: { comments: @note.comments, practice: @note.practice }
    assert_redirected_to note_path(assigns(:note))
  end

  test "should destroy note" do
    assert_difference('Note.count', -1) do
      delete :destroy, id: @note
    end

    assert_redirected_to notes_path
  end
end
