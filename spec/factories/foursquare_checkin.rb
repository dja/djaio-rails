FactoryGirl.define do
  factory :foursquare_checkin do
    checkinid "5962bc35356b492de7721fe9"
    timestamp { Time.at(1499642933).to_datetime}
    data { File.open(Rails.root + 'spec/fixtures/foursquare_checkin.json').read }
  end
end
