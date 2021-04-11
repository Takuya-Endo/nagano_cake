class Public::OrdersController < ApplicationController

  before_action :authenticate_customer!

  def new
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @items = Item.all
    @customer = Customer.find(current_customer.id)
    @order = Order.new
  end

  def orders_confirm
    @order = Order.new(order_params)
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @items = Item.all
  end

  def thanks
    CartItem.where(customer_id: current_customer).destroy_all
  end

  def create
    @order = Order.new(order_params)
    @order.save

    cart_items = CartItem.where(customer_id: current_customer.id)
    items = Item.all
    cart_items.each do |cart_item|
      item = items.find_by(id: cart_item.item_id)
      order_detail = OrderDetail.new

      order_detail.order_id = @order.id
      order_detail.item_id = item.id
      order_detail.tax_included_price = item.price * 1.1
      order_detail.amount = cart_item.amount

      order_detail.save
    end
    # order_detail = @order_details.map do |order_detail_params|
    # @order_details = OrderDetail.new(order_details_params)
    # @order_details.each do |order_detail|
      # order_detail = OrderDetail.new(order_details_params)
      # order_detail = Order.new(order_params)
      # order_detail = @order.build_OrderDetail

      # order_detail.save
    # end
    # end
    redirect_to '/orders/thanks'
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
    @items = Item.all
  end

  def show
    @order = Order.find(params[:id])
    @items = Item.all
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :shipping_postal_code, :shipping_address, :shipping_name, :shipping_fee, :total_payment, :payment)#, order_detail: [:order_id, :item_id, :tax_included_price, :amount])
  end

  # def order_details_params
    # params.require(:order_details).permit(order_ids: [], item_ids: [], tax_included_prices: [], amounts: [])
  # end

  # def order_detail_params
    # params.require(:order_detail).permit(:order_id, :item_id, :tax_included_price, :amount, order_details: [])
  # end

  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :tax_included_price, :amount)
  end

end
