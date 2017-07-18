describe API::Base do
  let!(:twitter_status) { create :twitter_status }

  context 'GET /api/v1/twitter_statuses' do
    it 'gets the most recent twitter statuses' do
      get '/api/v1/twitter_statuses'

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)
      expect(body['twitter_statuses'][0]['id']).to eq twitter_status.id
    end

    it 'gets the most recent twitter statuses' do
      twitter_status_2 = create(:twitter_status)
      get '/api/v1/twitter_statuses?count=2'

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)
      expect(body['twitter_statuses'].length).to eq 2
    end
  end
end
