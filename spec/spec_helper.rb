require 'grape'
require 'grape-swagger'
require 'grape-entity'
require 'rack/cors'
require 'rack/test'
require 'fakeredis'
require 'fakeredis/rspec'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app', 'lib'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app', 'api'))


ENV["RACK_ENV"] = 'test'


DEFAULT_UUID = '384fb29b-c53f-4d71-8498-a35e8a7321a4'

RSpec.configure do |config|

  config.mock_with :rspec
  config.expect_with :rspec
  config.color = true
  config.include Rack::Test::Methods

  config.before do
    Redis::Connection::Memory.reset_all_databases
  end

  module SecureRandom
    def self.uuid
      DEFAULT_UUID
    end
  end

end

def app
  SalesApi
end
