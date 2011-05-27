class Order < ActiveRecord::Base
  attr_accessible :customer_id, :status

  has_many :order_items, :dependent => :destroy

  def formatted_total
    Product.format_price(total)
  end

  def total
    result = 0
    order_items.each do |item|
      result = result + item.subtotal
    end
    return result

    #order_items.inject(0){|total, item| total + item.subtotal}
  end
end
