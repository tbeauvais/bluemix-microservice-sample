require 'grape'
require 'grape-swagger'
require 'grape-entity'
require 'rack/cors'
require_relative 'app/lib/sales'
require_relative 'app/lib/sale'
require_relative 'app/lib/entities'
require_relative 'app/api/sales_api'

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [ :get, :post, :put, :delete, :options ]
  end
end

class API < Grape::API
  mount SalesApi
  add_swagger_documentation api_version: 'v1', models: [Entities::Sale, Entities::Sales]
end

use Rack::Static, urls: ['/public']

run API.new
