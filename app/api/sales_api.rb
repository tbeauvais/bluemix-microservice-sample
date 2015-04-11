require 'json'

class SalesApi  < Grape::API

  version 'v1', using: :path
  format :json

  namespace :sales do

    desc 'List of sales' , is_array: true, entity: Entities::Sales
    get '/', http_codes: [
             [200, 'Ok', Entities::Sales, is_array: true],
             [400, "Invalid parameter entry"]] do
      sales = Sales.new
      sales << Sale.new('1234','bob', 234.09)
      sales << Sale.new('4567','sam', 727.36)

      present sales, is_array: false, with: Entities::Sales, type: :full
    end

    desc 'Return a pong.'
    params do
      requires :id, type: Integer, desc: 'Pong id.'
    end
    get '/ping' do
      present({data: "pong #{params[:id]}"})
    end
  end
end