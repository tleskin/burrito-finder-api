class YelpService
  def burritos(lat, lon)
    params = { term: 'burrito' }
    coordinates = { latitude: lat, longitude: lon }
    businesses = Yelp.client.search_by_coordinates(coordinates, params).businesses

    businesses.map do |business|
      yb = YourBurritos.new
      # binding.pry
      yb.name = business.name
      yb.rating = business.rating
      yb.url = business.mobile_url
      yb.rating_large = business.rating_img_url_large
      yb.rating_small = business.rating_img_url_small
      yb.distance = business.distance
      yb.is_close = business.is_closed
      yb.address = business.location.address
      yb.city = business.location.city
      yb.state = business.location.state_code
      yb.country = business.location.country_code
      yb.zip = business.location.postal_code
      yb.latitude = business.location.coordinate.latitude
      yb.longitude = business.location.coordinate.longitude
      yb
    end
  end
end

class YourBurritos < OpenStruct

end
