Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # where your request comes from, eg: your react app ip address
    origins 'http://127.0.0.1:5173'
    # origins 'https://super-cool-domain.com' --- when you deploy

    resource '*',
              headers: :any,
              methods: %i[get post patch put delete ]
  end
end
