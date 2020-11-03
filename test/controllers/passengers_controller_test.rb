require "test_helper"

describe PassengersController do
  describe "index" do
    it "can get the passengers index path" do
      get passengers_path

      must_respond_with :success
    end
  end

  describe "show" do
    # it "can get a valid passenger" do
    #
    # end
  end

  describe "new" do
    # Your tests go here
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
