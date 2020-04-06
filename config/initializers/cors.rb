# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  if ENV['RAILS_ENV'] == 'development'
    allow do
      origins '*'
      resource '*', headers: :any, methods: [:get, :post, :options, :head]
    end
  else
    allow do
      origins /^https?:\/\/[w{3}]?.*dja.io$/, /^https?:\/\/[w{3}]?.*danieljacobarcher.com$/, /^https?:\/\/djaio.herokuapp.com$/, '199.38.176.0/22'
      resource '*', headers: :any, methods: [:get, :post, :options, :head]
    end
  end
end
