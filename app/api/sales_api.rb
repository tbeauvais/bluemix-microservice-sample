require 'json'
require_relative '../../app/lib/sales_access'

class SalesApi  < Grape::API

  version 'v1', using: :path
  format :json
  default_format :json

  namespace :sales do

    desc 'List of sales' , is_array: true, entity: Entities::Sales
    get '/', http_codes: [
             [200, 'Ok', Entities::Sales, is_array: true],
             [400, "Invalid parameter entry"]] do
      present SalesAccess.fetch_all, is_array: false, with: Entities::Sales, type: :full
    end

    desc 'Adds a new sales record.', entity: Entities::Sale, params: Entities::Sale.documentation.except(:id)
    post '/' , http_codes: [
               [201, 'Created', Entities::Sale]] do
      present SalesAccess.create(params[:name], params[:amount])
    end

    desc 'Returns a sales record for the specified id', entity: Entities::Sale
    params do
      requires :id, type: String, desc: 'Sales record id'
    end
    get '/:id' , http_codes: [
              [200, 'Ok', Entities::Sale]] do
      present SalesAccess.read(params[:id]), with: Entities::Sale, type: :full
    end

    desc 'Updates a sales record for the specified id.', entity: Entities::Sale, params: Entities::Sale.documentation.except(:id)
    params do
      requires :id, type: String, desc: 'Sales record id'
    end
    put '/:id' , http_codes: [
                 [200, 'Ok', Entities::Sale]] do
      present SalesAccess.update(params[:id], params[:name], params[:amount])
    end

    desc 'Deleted a sales record for the specified id.'
    params do
      requires :id, type: String, desc: 'Sales record id'
    end
    delete '/:id', http_codes: [
                   [200, 'Ok'],
                   [404, 'Not Found']] do
      SalesAccess.delete(params[:id])
    end

  end

  desc 'Return a pong.'
  params do
    requires :id, type: Integer, desc: 'Pong id.'
  end
  get :ping do
    {data: "pong #{params[:id]}"}
  end

end