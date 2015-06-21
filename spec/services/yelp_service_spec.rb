require "rails_helper"

RSpec.describe YelpService do
  describe "restaurants" do
    it "returns search results from Yelp Service" do
      VCR.use_cassette("search_results") do
        restaurants = YelpService.new.burritos(40.061394, -105.210401)
        expect(restaurants.first.name).to eq("Verde")
      end
    end
  end
end
