describe MapsController do
  it 'should return 201' do
    response = MapsController.find_burrito(39.749964, -105.000012)
    response.should eq(201)
  end
end
