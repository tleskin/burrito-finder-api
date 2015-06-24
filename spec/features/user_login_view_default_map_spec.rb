require "rails_helper"
require "helpers"

RSpec.describe "user tries to login" do
  it "can see the homepage" do
      visit root_path

      expect(page).to have_content("BurritoFinder")

      user_logs_in_with_facebook

      expect(page).to have_content("Burrito Me")
  end
end
