module Entities
  class Sale < Grape::Entity
    expose :id, documentation: { type: 'string', desc: 'ID of sales person.' }
    expose :name, documentation: { type: 'string', desc: 'Name of sales person.' }
    expose :amount, documentation: { type: 'float', desc: 'Total sales for sales person.' }
  end

  class Sales < Grape::Entity
    expose :count, documentation: { type: 'integer', desc: 'Total number of sales.' }
    expose :sales, documentation: { type: 'Sale', desc: 'All sales.', is_array: true }
  end
end

