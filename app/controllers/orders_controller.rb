class OrdersController < ApplicationController


  def new
    binding.pry
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


  private

  def order_params
    params.require(:order).permit(:item)
  end



end
