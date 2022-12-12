module Api
  module V1
    class Foursquare < Grape::API
      include Api::V1::Defaults

      resource :foursquare_checkins do
        params do
          optional :count, type: Integer, default: 1
        end
        get do
          FoursquareCheckin.is_public.order(timestamp: :desc).limit(permitted_params[:count])
        end
      end
    end
  end
end
