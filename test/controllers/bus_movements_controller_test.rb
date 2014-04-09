require 'test_helper'

class BusMovementsControllerTest < ActionController::TestCase
  setup do
    @bus_movement = bus_movements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bus_movements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bus_movement" do
    assert_difference('BusMovement.count') do
      post :create, bus_movement: {  }
    end

    assert_redirected_to bus_movement_path(assigns(:bus_movement))
  end

  test "should show bus_movement" do
    get :show, id: @bus_movement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bus_movement
    assert_response :success
  end

  test "should update bus_movement" do
    patch :update, id: @bus_movement, bus_movement: {  }
    assert_redirected_to bus_movement_path(assigns(:bus_movement))
  end

  test "should destroy bus_movement" do
    assert_difference('BusMovement.count', -1) do
      delete :destroy, id: @bus_movement
    end

    assert_redirected_to bus_movements_path
  end
end
