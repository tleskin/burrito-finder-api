require "rails_helper"

RSpec.describe "unregistered user" do
  context "visiting root path" do

    it "can see the homepage" do
      visit root_path

      expect(page).to have_content("Superior Real Food")
    end
  end
end
