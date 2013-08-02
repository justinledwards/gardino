require 'test_helper'

class RelaysControllerTest < ActionController::TestCase
  setup do
    @relay = relays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:relays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create relay" do
    assert_difference('Relay.count') do
      post :create, relay: { name: @relay.name, number: @relay.number, pin: @relay.pin }
    end

    assert_redirected_to relay_path(assigns(:relay))
  end

  test "should show relay" do
    get :show, id: @relay
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @relay
    assert_response :success
  end

  test "should update relay" do
    patch :update, id: @relay, relay: { name: @relay.name, number: @relay.number, pin: @relay.pin }
    assert_redirected_to relay_path(assigns(:relay))
  end

  test "should destroy relay" do
    assert_difference('Relay.count', -1) do
      delete :destroy, id: @relay
    end

    assert_redirected_to relays_path
  end
end
