Rails.application.config.middleware.insert_before 0, Rack::Cors do   #config/initializers/cors
  allow do
    origins "*"
    resource(
      "*",
      headers: :any,
      expose: ["Authorization"],
      methods: [:get, :patch, :put, :delete, :post, :options, :show],
    )
  end
end
