class YelpService
  def burritos(lat, lon)
    params = { term: 'burrito', limit: 10 }
    coordinates = { latitude: lat, longitude: lon }
    Yelp.client.search_by_coordinates(coordinates, params).businesses
  end
end
