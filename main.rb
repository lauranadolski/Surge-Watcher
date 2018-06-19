require 'rest-client'
require 'json'
require 'pry'

# response = RestClient.get('http://ron-swanson-quotes.herokuapp.com/v2/quotes')
# response.code #http status code
# response.body #body of the response
# JSON.parse(response)


# Our (current) Client ID: A2ihIeNpyuac
# Our (current) Client Secret: TV0zKoalK38YA-CK4x1Nc4hkugeWKG0x

# curl -X POST -H "Content-Type: application/json" \
#      --user "A2ihIeNpyuac:TV0zKoalK38YA-CK4x1Nc4hkugeWKG0x" \
#      -d '{"grant_type": "client_credentials", "scope": "public"}' \
#      'https://api.lyft.com/oauth/token'
#
#
#      Got back:
#      results = {"token_type": "Bearer", "access_token": "wB/XCOOWHC4RykPat9SujdZwNzuR9sXM0PAqm3qONM+JN2sT4Hwa2TNPdI3whgcQYfPDNZOtvY+T8rrsWeSL/CmuSUdqheHJ4DLG7zqJ0vR+Wr70uD7d0f8=", "expires_in": 86400, "scope": "public"}
#
#
#      curl --include -X GET -H 'Authorization: bearer wB/XCOOWHC4RykPat9SujdZwNzuR9sXM0PAqm3qONM+JN2sT4Hwa2TNPdI3whgcQYfPDNZOtvY+T8rrsWeSL/CmuSUdqheHJ4DLG7zqJ0vR+Wr70uD7d0f8=' \
#      'https://api.lyft.com/v1/cost?start_lat=37.7763&start_lng=-122.3918&end_lat=37.7972&end_lng=-122.4533'


def web_request_helper(url)
  film_information = RestClient.get(url)
  film_information_hash = JSON.parse(film_information)
  return film_information_hash
end

origin_lat =
origin_long =

destination_lat =
destination_long = 

lyft_hash = web_request_helper("http://api.lyft.com/v1/cost?start_lat=#{origin_lat}&start_lng=#{origin_long}8&end_lat=#{destination_lat}&end_lng=#{destination_long}")

primetime = lyft_hash["cost_estimates"][1]["primetime_percentage"]

binding.pry
