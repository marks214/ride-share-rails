class Passenger < ApplicationRecord
  has_many :trips
  validates :name, presence: true
  validates :phone_num, presence: true

  def sum_total
    total_sum = trips.sum(&:cost)
    return total_sum
  end

end
