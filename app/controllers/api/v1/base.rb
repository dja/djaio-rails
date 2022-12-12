module Api
  module V1
    class Base < Grape::API
      before do
        header 'X-Robots-Tag', 'noindex'
      end

      mount Api::V1::Foursquare
      mount Api::V1::Twitter
      mount Api::V1::Push
    end
  end
end
