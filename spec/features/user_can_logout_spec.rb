require "rails_helper"
require "helpers"

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe "user tries to login" do
  it "can see the homepage" do
      user_logs_in_with_facebook

      expect(page).to have_content("Burrito Me")

      click_link('Sign out')

      expect(page).to have_content("Find that perfect burrito no matter where you are.")
  end
end
