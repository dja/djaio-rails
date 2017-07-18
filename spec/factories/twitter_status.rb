FactoryGirl.define do
  factory :twitter_status do
    statusid "885029531551223808"
    timestamp { Time.at(1499888170).to_datetime}
    data { File.open(Rails.root + 'spec/fixtures/twitter_status.json').read }
  end
end
