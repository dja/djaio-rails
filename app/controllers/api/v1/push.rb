module API
  module V1
    class Push < Grape::API
      include API::V1::Defaults

      namespace :push do

        params do
          requires :checkin, type: JSON do
            requires :id, type: String
            requires :createdAt, type: Integer
          end
          requires :secret, type: String, values: ->(v) { v == ENV['FOURSQUARE_PUSH_SECRET'] }
          requires :user, type: JSON do
            requires :id, type: String
          end
        end
        post 'foursquare' do
          checkin = FoursquareCheckin.find_or_initialize_by(checkinid: permitted_params[:checkin][:id]) do |c|
            c.timestamp = Time.at(permitted_params[:checkin][:createdAt]).to_datetime
            c.data = params[:checkin]
          end
          if checkin.new_record? && checkin.save
            ActionCable.server.broadcast 'foursquare_checkins',
              foursquare_checkin: checkin.id
          end
          checkin
        end

      end

    end
  end
end
