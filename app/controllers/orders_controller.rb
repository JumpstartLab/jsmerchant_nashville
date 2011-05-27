class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params[:order])
    if @order.save
      redirect_to @order, :notice => "Successfully created order."
    else
      render :action => 'new'
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(params[:order])
      redirect_to @order, :notice  => "Successfully updated order."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to products_path, :notice => "Your cart has been emptied!"
  end
end
