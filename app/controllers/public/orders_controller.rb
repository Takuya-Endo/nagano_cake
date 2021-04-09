class Public::OrdersController < ApplicationController

  def new
    @customer = Customer.find(current_customer.id)
    @order = Order.new
  end

  def orders_confirm
    @order = Order.new(order_params)
  end

  def thanks
    CartItem.where(customer_id: current_customer).destroy_all
  end

  def create
    order = Order.new(order_params)
    order.save
    redirect_to '/orders/thanks'
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :shipping_postal_code, :shipping_address, :shipping_name, :shipping_fee, :total_payment, :payment)
  end

end
