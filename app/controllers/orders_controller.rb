class OrdersController < ApplicationController

  def index
    Order.all
  end
  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.new(order_params)
    if @order.save
      redirect_to request.referer
    else
      redirect_to root_path
    end
  end

  def show
    @order
  end

  private

  def order_params
    params.require(:order).permit(:item)
  end



end
