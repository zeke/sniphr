require 'test_helper'

class SnipsControllerTest < ActionController::TestCase
  setup do
    @snip = snips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:snips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create snip" do
    assert_difference('Snip.count') do
      post :create, :snip => @snip.attributes
    end

    assert_redirected_to snip_path(assigns(:snip))
  end

  test "should show snip" do
    get :show, :id => @snip.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @snip.to_param
    assert_response :success
  end

  test "should update snip" do
    put :update, :id => @snip.to_param, :snip => @snip.attributes
    assert_redirected_to snip_path(assigns(:snip))
  end

  test "should destroy snip" do
    assert_difference('Snip.count', -1) do
      delete :destroy, :id => @snip.to_param
    end

    assert_redirected_to snips_path
  end
end
