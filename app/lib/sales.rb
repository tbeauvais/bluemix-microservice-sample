class Sales
  attr_accessor :sales

  def initialize()
    self.sales = []
  end

  def count
    sales.size
  end

  def <<(sale)
    self.sales << sale
  end

end
