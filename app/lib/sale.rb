class Sale
  attr_accessor :id, :name, :amount

  def initialize(id, name, amount)
    self.id = id
    self.name = name
    self.amount = amount
  end

end
