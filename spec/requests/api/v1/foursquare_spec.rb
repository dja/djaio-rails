describe Api::Base do
  let!(:foursquare_checkin) { create :foursquare_checkin }

  context 'GET /api/v1/foursquare_checkins' do
    it 'gets the most recent foursquare checkin' do
      get '/api/v1/foursquare_checkins'

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)
      expect(body['foursquare_checkins'][0]['id']).to eq foursquare_checkin.id
    end

    it 'gets the most recent foursquare checkins' do
      get '/api/v1/foursquare_checkins?count=1'

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)
      expect(body['foursquare_checkins'].length).to eq 1
    end
  end
end
