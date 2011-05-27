class OrderItem < ActiveRecord::Base
  attr_accessible :order_id, :product_id, :quantity
  belongs_to :order
  belongs_to :product

  validates_presence_of :order_id, :product_id

  validates_numericality_of :quantity,
                            :only_integer => true,
                            :greater_than => 0

  def formatted_subtotal
    Product.format_price(subtotal)
  end

  def subtotal
    product.price * quantity
  end
end
