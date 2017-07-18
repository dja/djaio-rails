module API
  module V1
    class Base < Grape::API

      before do
        header 'X-Robots-Tag', 'noindex'
      end

      mount API::V1::Foursquare
      mount API::V1::Twitter
      mount API::V1::Push
    end
  end
end
