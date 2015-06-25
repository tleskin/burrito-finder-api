require 'rails_helper'

RSpec.describe MapsController, type: :controller do

  before(:each) do
    @user = User.create({id: 1,
                        provider: "facebook",
                        uid: "11111111111111111",
                        name: "Jorge Snow",
                        email: "jorge@turing.io"})
  end

  describe "GET #index" do
    it "returns http success" do
      get :index, nil, { user_id: @user.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about, nil, { user_id: @user.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #burritos" do
    it "returns http success" do
      VCR.use_cassette("find_burritos") do
        xhr :post, :find_burritos, {lat:39.749964,  lon: -105.000012}, { user_id: @user.id}

        expect(response).to have_http_status(:success)
      end
    end
  end
end
