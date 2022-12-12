module Api
  module V1
    class Twitter < Grape::API
      include Api::V1::Defaults

      resource :twitter_statuses do
        params do
          optional :count, type: Integer, default: 20
        end
        get do
          TwitterStatus.is_public.order(timestamp: :desc).limit(permitted_params[:count])
        end
      end
    end
  end
end
