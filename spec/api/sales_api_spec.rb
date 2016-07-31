require 'spec_helper'
require 'entities'
require 'sale'
require 'sales'
require 'sales_access'
require 'sales_api'

describe SalesApi do

  include Rack::Test::Methods

  def app
    SalesApi
  end

  context 'sales' do

    context 'get' do

      it 'responds with 200' do
        get '/v1/sales'
        expect(last_response.status).to eq 200
      end

      it 'returns empty array when do sales' do
        get '/v1/sales'
        expect(JSON.parse(last_response.body)).to eq ({'count' =>0, 'sales' => []})
       end


    end

  end

end
