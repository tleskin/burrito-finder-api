class YelpService
  def burritos(lat, lon, user)
    params = { term: 'burrito' }
    coordinates = { latitude: lat, longitude: lon }
    businesses = Yelp.client.search_by_coordinates(coordinates, params).businesses
    index = 0
    city = Yelp.client.search_by_coordinates(coordinates, params).businesses.first.location.city
    state = Yelp.client.search_by_coordinates(coordinates, params).businesses.first.location.state_code
    Keen.publish(:usage, {
      :user? => user,
      :city => city,
      :state => state
    })
    
    businesses.map do |business|
      yb = YourBurritos.new
      yb.id = index
      yb.name = business.name
      yb.rating = business.rating
      yb.url = business.mobile_url
      yb.rating_large = business.rating_img_url_large
      yb.rating_small = business.rating_img_url_small
      yb.distance = (business.distance / 1000).round(2)
      yb.address = business.location.address
      yb.city = business.location.city
      yb.state = business.location.state_code
      yb.country = business.location.country_code
      yb.zip = business.location.postal_code
      yb.latitude = business.location.coordinate.latitude
      yb.longitude = business.location.coordinate.longitude
      yb.user = user
      index += 1
      yb
    end
  end
end

class YourBurritos < OpenStruct
end
