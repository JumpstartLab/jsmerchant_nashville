module ProductsHelper
  def product_image(product)
    image_tag("/images/products/" + product.image_url)
  end

  def print_stock(stock, requested = 1)
    if stock >= requested
      content_tag :span, "In Stock", :class => "in_stock"
    elsif stock > 0
      content_tag :span, "#{stock} available", :class => "low_stock"
    else
      content_tag :span, "Out of Stock", :class => "out_stock"
    end
  end
end
