describe API::Base do

  context 'POST /api/v1/push/foursquare' do
    it 'creates a new foursquare checkin' do
      data = {
        checkin: {"id":"5962bc35356b492de7721fe10", "createdAt": 1499642933, "type":"checkin"}.to_json,
        secret: ENV['FOURSQUARE_PUSH_SECRET'],
        user: {"id":"232771", "firstName":"Daniel", "lastName":"Archer"}.to_json
      }
      post '/api/v1/push/foursquare',
           params: data

      expect(response.status).to eq(201)
      expect(FoursquareCheckin.count).to eq(1)

      body = JSON.parse(response.body)
      expect(body['foursquare_checkin']['id']).not_to be_nil
    end
  end
end
