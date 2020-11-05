require "test_helper"

describe TripsController do
  before do
    Trip.create(ride_id: 1, driver_id: 2, passenger_id: 3, date: "2016-04-05", rating: 4, cost: 12.93)
  end

  let (:trip_hash) {
    {
        trip: {
            ride_id: 1,
            driver_id: 2,
            passenger_id: 3,
            date: "2016-04-05",
            rating: 4,
            cost: 12.93
        },
    }
  }
  let (:trip) {
    Trip.create ride_id: 1, driver_id: 1, passenger_id: 1, date: "2016-04-05", rating: 4, cost: 12.93
  }
  describe "show" do
<<<<<<< HEAD
    # it "can get a valid trip" do
    #   get #nested route?
    #
    #   must_respond_with :success
    # end
    #trip
    get trip_path(trip.id)
    must_respond_with :success
=======
    it "can get a valid trip" do
      trip
      get trip_path(trip.ride_id)

      must_respond_with :redirect
    end
>>>>>>> 645b9a9f673287ec23ae3abab745ca1a8b241119
  end

  describe "create" do
    # Your tests go here
  end

  describe "edit" do
    # Your tests go here
  end

  describe "update" do
    # Your tests go here
  end

  describe "destroy" do
    # Your tests go here
  end
end
