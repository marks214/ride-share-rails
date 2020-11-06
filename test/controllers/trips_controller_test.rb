require "test_helper"

describe TripsController do
  # before do
  #   Trip.create(id: 1, driver_id: 2, passenger_id: 3, date: "2016-04-05", rating: 4, cost: 12.93)
  # end
  #
  # let (:trip_hash) {
  #   {
  #       trip: {
  #           id: 1,
  #           driver_id: 2,
  #           passenger_id: 3,
  #           date: "2016-04-05",
  #           rating: 4,
  #           cost: 12.93
  #       },
  #   }
  # }
  # let (:trip)
  #   Trip.create id: 1, driver_id: 1, passenger_id: 1, date: "2016-04-05", rating: 4, cost: 12.93
  # }
  describe "show" do
    it "can get a valid trip path" do
      trip = Trip.create(id: 1, driver_id: 2, passenger_id: 3, date: "2016-04-05", rating: 4, cost: 12.93)

      get trip_path(trip.id)

      must_respond_with :success
    end

    it "can redirect if there's in invalid trip" do
      get trip_path(-1)

      must_respond_with :redirect
    end
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
