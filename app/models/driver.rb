class Driver < ApplicationRecord
  has_many :trips
  validates :vin, length: { is: 17, message: "VIN must be 17 characters"}
end
