class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @items = Item.all
  end

  def update
    cart_item = CartItem.find(params[:id])
    # cart_item.customer_id = current_customer.id
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.where(customer_id: current_customer).destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)

      @cart_item.customer_id = current_customer.id

    @cart_item.save
    redirect_to cart_items_path
  end

  private
    def cart_item_params
      params.permit(:item_id, :customer_id, :amount)
    end

end
