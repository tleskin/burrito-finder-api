require 'rails_helper'
require "helpers"

RSpec.describe MapsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      user = User.create({id: 1,
                          provider: "facebook",
                          uid: "11111111111111111",
                          name: "Jorge Snow",
                          email: "jorge@turing.io"})

      get :index, nil, { user_id: user.id}
      expect(response).to have_http_status(:success)
    end
  end
end
