# require '../config/environment'
require 'pry'

# your code to run the application

def run_surge_watcher

  while true
    def ride_checker
        counter = 1
        primetime_percentage = 20
        estimated_cost_cents_max = 5000
      if primetime_percentage > 0
        puts "This is ping #{counter}."
        counter += 1
        puts "Your ride is currently surging! There's a #{primetime_percentage}% price increase at this time."
        puts "Your ride will cost approx. $#{estimated_cost_cents_max / 100}."
      else
        puts "Good news! Your ride isn't affected by surge pricing."
        puts "Your ride will cost approx. $#{estimated_cost_cents_max / 100}."
      end
    end

    puts "Welcome to Surge Watcher!"
    puts "You can use this app to monitor Lyft prices over time."
    puts "Type exit at any time to dip."
    puts "Please enter your name:"
    user_name = gets.chomp
    break if user_name == "exit"
    puts "Thanks #{user_name}! Please enter the latitude of your ride origin:"
    origin_lat = gets.chomp
    break if origin_lat == "exit"
    puts "Please enter the longitude of your ride origin:"
    origin_long = gets.chomp
    break if origin_long == "exit"
    puts "Please enter the latitude of your ride destination:"
    destination_lat = gets.chomp
    break if destination_lat == "exit"
    puts "Please enter the longitude of your ride destination:"
    destination_long = gets.chomp
    break if destination_long == "exit"
    puts "Great. Now enter how many seconds you want to wait between pings:"
    ping_sleep_time = gets.chomp
    break if ping_sleep_time == "exit"
    ride_checker
    sleep(ping_sleep_time.to_i)
    puts "Now waiting #{ping_sleep_time} seconds until the next ping."

      until gets.chomp == "exit"
        ride_checker
      end


  end
  puts "Goodbye!"
end

binding.pry

origin_lat = 40.7052799
origin_long = -74.0162136

destination_lat = 40.7769271
destination_long = -73.8739659


# 0. Give the user instructions/introduction to the program.
# 1. Get the user's name.
# 2. Get the user's origin and destination (lat + long for now.. tb-refactored to include g-maps API) [error-check]
# 3. Get user to input number of seconds to wait between "ping"
# 4. Run initial ping, display primetime? and price information.
# 5. Run all subsequent pings, until user specifically exits.
#   (using sleep())
# 6. Restart at beginning (refactor to restart just at origin/destination input)
