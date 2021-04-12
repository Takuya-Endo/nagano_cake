class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.page(params[:page]).reverse_order
  end

  def update_order_status
    @order = Order.find(params[:id])
    @customer = Customer.find(@order.customer_id)
    @order_details = OrderDetail.where(order_id: @order.id)
  end
end
