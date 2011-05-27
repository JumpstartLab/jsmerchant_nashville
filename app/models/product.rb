class Product < ActiveRecord::Base
  attr_accessible :title, :stock, :description, :image_url, :price_in_dollars

  validates_numericality_of :price
  validates_numericality_of :stock, :greater_than_or_equal_to => 0,
                            :message => "No negatives, idiot."

  def price_in_dollars
    Product.format_price(self.price) if self.price
  end

  def price_in_dollars=(input)
    input = input.delete("$")
    self.price = (input.to_f * 100).to_i
  end

  def self.format_price(price_in_cents)
    (format("$%.2f", price_in_cents/100.0))
  end
end
