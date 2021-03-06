require 'csv'

DRIVER_FILE = Rails.root.join('db', 'seed_data', 'drivers.csv')
puts "Loading raw drivers data from #{DRIVER_FILE}"

driver_failures = []
CSV.foreach(DRIVER_FILE, :headers => true) do |row|
  driver = Driver.new
  driver.id = row['id']
  driver.name = row['name']
  driver.vin = row['vin']
  driver.available = row['available']
  successful = driver.save
  if !successful
    driver_failures << driver
    puts "Failed to save drivers: #{driver.inspect}"
  else
    puts "Created drivers: #{driver.inspect}"
  end
end

puts "Added #{Driver.count} drivers records"
puts "#{driver_failures.length} drivers failed to save"



PASSENGER_FILE = Rails.root.join('db', 'seed_data', 'passengers.csv')
puts "Loading raw passengers data from #{PASSENGER_FILE}"

passenger_failures = []
CSV.foreach(PASSENGER_FILE, :headers => true) do |row|
  passenger = Passenger.new
  passenger.id = row['id']
  passenger.name = row['name']
  passenger.phone_num = row['phone_num']
  successful = passenger.save
  if !successful
    passenger_failures << passenger
    puts "Failed to save passengers: #{passenger.inspect}"
  else
    puts "Created passengers: #{passenger.inspect}"
  end
end

puts "Added #{Passenger.count} passengers records"
puts "#{passenger_failures.length} passengers failed to save"



TRIP_FILE = Rails.root.join('db', 'seed_data', 'trips.csv')
puts "Loading raw trips data from #{TRIP_FILE}"

trip_failures = []
CSV.foreach(TRIP_FILE, :headers => true) do |row|
  trip = Trip.new
  trip.id = row['id']
  trip.driver_id = row['driver_id']
  trip.passenger_id = row['passenger_id']
  trip.date = Date.strptime(row['date'], '%Y-%m-%d')
  trip.rating = row['rating']
  trip.cost = row['cost']
  successful = trip.save
  if !successful
    trip_failures << trip
    puts "Failed to save trips: #{trip.inspect}"
  else
    puts "Created trips: #{trip.inspect}"
  end
end

puts "Added #{Trip.count} trips records"
puts "#{trip_failures.length} trips failed to save"


# Since we set the primary key (the ID) manually on each of the
# tables, we've got to tell postgres to reload the latest ID
# values. Otherwise when we create a new record it will try
# to start at ID 1, which will be a conflict.
puts "Manually resetting PK sequence on each table"
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

puts "done"
