require "rails_helper"
require "helpers"

RSpec.feature "user visits map page and can add favorite" do
  scenario "can see favorites on favorites page" do

      user = User.create({id: 1,
                          provider: "facebook",
                          uid: "11111111111111111",
                          name: "Jorge Snow",
                          email: "jorge@turing.io"})

      my_favorite = Favorite.create({name: "Turing.io",
                                     url: "http://turing.io",
                                     address: "123 Main Street",
                                     city: "Denver",
                                     zip: "CO",
                                     state: "80202",
                                     user_id: user.id})

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit favorites_path

    expect(page).to have_content("Favorite Burritos")

    expect(page).to have_content("Turing.io")

    click_link_or_button("Remove From Favorites")

    expect(page).to_not have_content("Turing.io")
  end
end
