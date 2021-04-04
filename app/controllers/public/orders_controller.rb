class Public::OrdersController < ApplicationController

  def new
    @customer = Customer.find(current_customer.id)
    @order = Order.new
  end

  def orders_confirm
  end

  def thanks
  end

  def create
  end

  def index
  end

  def show
  end
end
