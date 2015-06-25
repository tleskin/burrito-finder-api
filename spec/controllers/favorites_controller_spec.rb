require 'rails_helper'
require "helpers"

RSpec.describe FavoritesController, type: :controller do

  before(:each) do
    @user = User.create({id: 1,
                        provider: "facebook",
                        uid: "11111111111111111",
                        name: "Jorge Snow",
                        email: "jorge@turing.io"})
  end

  describe "GET #index" do
    it "returns http success" do
      get :index, nil, { user_id: @user.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #burritos" do
    it "returns http success" do
      VCR.use_cassette("favorite_burritos") do
        xhr :post, :create, {name: "Turing.io",
                             url: "http://turing.io",
                             address: "123 Main Street",
                             city: "Denver",
                             zip: "CO",
                             state: "80202",
                             user_id: @user.id},
                             { user_id: @user.id}

        expect(response).to have_http_status(:success)
      end
    end

    it "returns http success after trying to post a second time" do
      VCR.use_cassette("favorite_burritos") do
        xhr :post, :create, {name: "Turing.io",
                             url: "http://turing.io",
                             address: "123 Main Street",
                             city: "Denver",
                             zip: "CO",
                             state: "80202",
                             user_id: @user.id},
                             { user_id: @user.id}

         xhr :post, :create, {name: "Turing.io",
                              url: "http://turing.io",
                              address: "123 Main Street",
                              city: "Denver",
                              zip: "CO",
                              state: "80202",
                              user_id: @user.id},
                              { user_id: @user.id}

        expect(response).to have_http_status(:success)
      end
    end
  end
end
