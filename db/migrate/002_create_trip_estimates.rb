class CreateTripEstimates < ActiveRecord::Migration[5.1]

  def change
    create_table :trip_estimates do |t|
      t.string :name,
      t.int :estimated_cost_cents_max, default: => estimated_cost_cents_max,
      t.int :primetime_percentage, default: => primetime_percentage.to_i
    end
  end

# Getting the Lyft API data/////////////////////////////////////////////

origin_lat = 40.7052799
origin_long = -74.0162136

destination_lat = 40.7769271
destination_long = -73.8739659

lyft_hash = web_request_helper("http://api.lyft.com/v1/cost?start_lat=#{origin_lat}&start_lng=#{origin_long}8&end_lat=#{destination_lat}&end_lng=#{destination_long}")

def web_request_helper(url)
  film_information = RestClient.get(url)
  film_information_hash = JSON.parse(film_information)
  return ride_estimate_information_hash
end

estimated_cost_cents_max = lyft_hash["cost_estimates"][1]["estimated_cost_cents_max"]

primetime_percentage = lyft_hash["cost_estimates"][1]["primetime_percentage"]


end
