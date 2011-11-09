require 'test_helper'

class TodolistsControllerTest < ActionController::TestCase
  setup do
    @todolist = todolists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:todolists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create todolist" do
    assert_difference('Todolist.count') do
      post :create, todolist: @todolist.attributes
    end

    assert_redirected_to todolist_path(assigns(:todolist))
  end

  test "should show todolist" do
    get :show, id: @todolist.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @todolist.to_param
    assert_response :success
  end

  test "should update todolist" do
    put :update, id: @todolist.to_param, todolist: @todolist.attributes
    assert_redirected_to todolist_path(assigns(:todolist))
  end

  test "should destroy todolist" do
    assert_difference('Todolist.count', -1) do
      delete :destroy, id: @todolist.to_param
    end

    assert_redirected_to todolists_path
  end
end
