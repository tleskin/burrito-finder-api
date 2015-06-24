require "rails_helper"
require "helpers"

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe "user visits favorites page" do
  it "can see favorites" do
      user_logs_in_with_facebook

      click_link('Favorites')
      expect(page).to have_content("Favorite Burritos")
  end
end
