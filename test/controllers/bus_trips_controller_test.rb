require 'test_helper'

class BusTripsControllerTest < ActionController::TestCase
  setup do
    @bus_trip = bus_trips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bus_trips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bus_trip" do
    assert_difference('BusTrip.count') do
      post :create, bus_trip: {  }
    end

    assert_redirected_to bus_trip_path(assigns(:bus_trip))
  end

  test "should show bus_trip" do
    get :show, id: @bus_trip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bus_trip
    assert_response :success
  end

  test "should update bus_trip" do
    patch :update, id: @bus_trip, bus_trip: {  }
    assert_redirected_to bus_trip_path(assigns(:bus_trip))
  end

  test "should destroy bus_trip" do
    assert_difference('BusTrip.count', -1) do
      delete :destroy, id: @bus_trip
    end

    assert_redirected_to bus_trips_path
  end
end
