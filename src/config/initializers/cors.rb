Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "csc415-server29.hpc.tcnj.edu:3000"

    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
