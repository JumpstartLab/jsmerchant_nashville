class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

private
  def load_order
    begin
      @order = Order.find(session[:order_id])
    rescue
      @order = Order.create(:status => "unsubmitted")
      session[:order_id] = @order.id
    end
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end
end
