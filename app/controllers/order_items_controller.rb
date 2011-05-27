class OrderItemsController < ApplicationController
  before_filter :load_order

  def create
    @order_item = @order.order_items.find_or_initialize_by_product_id(params[:product_id])
    @order_item.quantity += 1
    @order_item.save
    redirect_to @order_item.order, :notice => "Added #{@order_item.product.title} to the order."
  end

  def edit
    @order_item = OrderItem.find(params[:id])
  end

  def update
    @order_item = OrderItem.find(params[:id])

    if params[:order_item][:quantity].to_i == 0
      @order_item.destroy

      if @order_item.order.order_items.empty?
        redirect_to products_path, :notice => "No items left in the order"
      else
        redirect_to @order_item.order, :notice => "Product Removed"
      end
    elsif @order_item.update_attributes(params[:order_item])
      redirect_to @order_item.order, :notice  => "Updated quantity of #{@order_item.product.title}."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    redirect_to @order_item.order, :notice => "Successfully destroyed order item."
  end
end
