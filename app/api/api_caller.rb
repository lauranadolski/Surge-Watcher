# Getting the Lyft API data/////////////////////////////////////////////
#
# origin_lat = 40.7052799
# origin_long = -74.0162136
#
# destination_lat = 40.7769271
# destination_long = -73.8739659

def hash_populator(origin_lat, origin_long, destination_lat, destination_long)
  lyft_hash = web_request_helper("http://api.lyft.com/v1/cost?start_lat=#{origin_lat}&start_lng=#{origin_long}8&end_lat=#{destination_lat}&end_lng=#{destination_long}")
  return lyft_hash
end

def web_request_helper(url)
  film_information = RestClient.get(url)
  film_information_hash = JSON.parse(film_information)
  return ride_estimate_information_hash
end
# 
# def get_ride_price_estimate
#
#   estimated_cost_cents_max = lyft_hash["cost_estimates"][1]["estimated_cost_cents_max"]
#   return estimated_cost_cents_max
# end
#
#
# primetime_percentage = lyft_hash["cost_estimates"][1]["primetime_percentage"]
