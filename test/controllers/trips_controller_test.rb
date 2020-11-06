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
  # let (:trip) {
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
    it "can create a new trip" do
      trip_hash = {
          trip: {
              id: 1,
              driver_id: 2,
              passenger_id: 3,
              date: "2016-04-05",
              rating: 4,
              cost: 12.93
          },
      }

      expect {
        post trips_path, params: trip_hash
      }.must_change "Trip.count", 1

      new_trip = Trip.find_by(id: trip_hash[:trip][:id])
      expect(new_trip.id).must_equal trip_hash[:trip][:id]
      expect(new_trip.driver_id).must_equal trip_hash[:trip][:driver_id]
    end

  end

  describe "edit" do
    it "can get the edit page for an existing trip" do
      trip = Trip.create(id: 1, driver_id: 2, passenger_id: 3, date: "2016-04-05", rating: 4, cost: 12.93)
      get edit_trip_path(trip.id)

      must_respond_with :success
    end

    it "can redirect if trip to edit doesn't exist" do
      get edit_trip_path(-1)

      must_respond_with :redirect
    end
  end

  describe "update" do
    # it "can update an existing trip" do
    #   trip_hash = {
    #       trip: {
    #           id: 1,
    #           driver_id: 2,
    #           passenger_id: 3,
    #           date: "2016-04-05",
    #           rating: 4,
    #           cost: 12.93
    #       },
    #   }
    #   id = Trip.first.id
    #
    #   expect {
    #     patch trip_path(id), params: trip_hash
    #   }.wont_change "Trip.count"
    #
    #   must_redirect_to trips_path
    #
    #   trip_to_update = Trip.find_by(id: id)
    #   expect(trip_to_update.id).must_equal trip_hash[:trip][:id]
    # end
  end

  describe "destroy" do
    # Your tests go here
  end
end
