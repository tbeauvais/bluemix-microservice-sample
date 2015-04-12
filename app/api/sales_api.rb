require 'json'

class SalesApi  < Grape::API

  version 'v1', using: :path
  format :json

  namespace :sales do

    desc 'List of sales' , is_array: true, entity: Entities::Sales
    get '/', http_codes: [
             [200, 'Ok', Entities::Sales, is_array: true],
             [400, "Invalid parameter entry"]] do
      sales = ::Sales.new
      sales << ::Sale.new('1234','bob', 234.09)
      sales << ::Sale.new('4567','sam', 727.36)

      present sales, is_array: false, with: Entities::Sales, type: :full
    end

    desc 'Returns a sales record for the specified id.', entity: Entities::Sale
    params do
      requires :id, type: Integer, desc: 'Sales record id'
    end
    get '/:id' , http_codes: [
              [200, 'Ok', Entities::Sale]] do
      present ::Sale.new(params[:id],'Sam Smith', 543.87)
    end

    desc 'Updates a sales record for the specified id.', entity: Entities::Sale, params: Entities::Sale.put_documentation
    params do
      requires :id, type: Integer, desc: 'Sales record id'
    end
    put '/:id' , http_codes: [
                 [204, 'Ok']] do
      present ::Sale.new(params[:id], params[:name], params[:amount])
    end

    desc 'Adds a new sales record.', entity: Entities::Sale, params: Entities::Sale.put_documentation
    post '/' , http_codes: [
                 [201, 'Created']] do
      present ::Sale.new(34532, params[:name], params[:amount])
    end

    desc 'Deleted a sales record for the specified id.'
    params do
      requires :id, type: Integer, desc: 'Sales record id'
    end
    delete '/:id' , http_codes: [
                 [200, 'Ok']] do
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