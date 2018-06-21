require_relative '../config/environment.rb'
require_relative '../db/migrate/001_create_users.rb'
require_relative '../db/migrate/002_create_trip_estimates.rb'
require_relative '../db/migrate/003_create_origins.rb'
require_relative '../db/migrate/004_create_destinations.rb'
require_relative '../app/api/api_caller.rb'
require_relative '../db/schema.rb'
require 'geocoder'
require 'pry'

def run_surge_watcher

  while true
    def ride_checker(trip)

        our_hash = hash_populator(trip.origin.latitude, trip.origin.longitude, trip.destination.latitude, trip.destination.longitude)

        primetime_percentage = get_primetime_percentage(our_hash)
        estimated_cost_cents_max = get_ride_price_estimate(our_hash)

      if primetime_percentage.to_i > 0
        puts "Your ride is currently surging! There's a #{primetime_percentage}% price increase at this time."
        puts "Your ride will cost approx. $#{estimated_cost_cents_max / 100}."
      else
        puts "Good news! Your ride isn't affected by surge pricing."
        puts "Your ride will cost approx. $#{estimated_cost_cents_max / 100}."
      end
      puts "Press enter to initiate the next ping. Type exit to exit."
    end

    puts "Welcome to Surge Watcher!"
    puts "You can use this app to monitor Lyft prices over time."
    puts "Type exit at any time to dip."
    puts "Please enter your name:"
      user_name = gets.chomp
      break if user_name == "exit"
      user_name = User.create(name: user_name)
    puts "Thanks #{user_name.name}! Please enter the address of your ride origin:"
      origin = gets.chomp
      break if origin == "exit"
      lat_long = Geocoder.search(origin).first.coordinates
      origin = Origin.create(:address => origin, :latitude => lat_long[0], :longitude => lat_long[1])
    puts "Please enter the address of your ride destination:"
      destination = gets.chomp
      break if destination == "exit"
      lat_long = Geocoder.search(destination).first.coordinates
      destination = Destination.create(:address => destination, :latitude => lat_long[0], :longitude => lat_long[1])
    puts "Great. Let's check on your ride estimate."
      ride_checker(TripEstimate.create(user_id: user_name.id, origin_id: origin.id, destination_id: destination.id))
    until gets.chomp == "exit"
      ride_checker(TripEstimate.create(user_id: user_name.id, origin_id: origin.id, destination_id: destination.id))
    end
    break
  end
  puts "Goodbye!"
end

run_surge_watcher
