require_relative 'redis_connection'
require 'json'

class SalesAccess

  Client = ::RedisConnection.client

  HASH_KEY = 'sales_data'

  def self.fetch_all
    data = Client.hgetall HASH_KEY
    data.each_with_object Sales.new do |(id, value), sales|
      sale = JSON.parse(value)
      sales << ::Sale.new(id, sale['name'], sale['amount'].to_f)
    end
  end

  def self.read(id)
    data = Client.hget HASH_KEY, id
    if data
      sale = JSON.parse(data)
      ::Sale.new(id, sale['name'], sale['amount'].to_f)
    end
  end

  def self.create(name, amount)
    id = SecureRandom.uuid
    Client.hset HASH_KEY, id, {name: name, amount: amount}.to_json
    ::Sale.new(id, name, amount.to_f)
  end

  def self.update(id, name, amount)
    Client.hset HASH_KEY, id, {name: name, amount: amount}.to_json
    ::Sale.new(id, name, amount.to_f)
  end

  def self.delete(id)
    Client.hdel HASH_KEY, id
    rescue
      false
    true
  end

end
