class OrdersController < ApplicationController


  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
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
