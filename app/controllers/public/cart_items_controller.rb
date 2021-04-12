class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @items = Item.all
  end

  def update
    # @cart_item = CartItem.find(@cart_item.id)
    # @cart_item = CartItem.find_by(id: @cart_item.id)
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

    if @cart_item.save
      redirect_to cart_items_path
    else
      # @item = Item.find_by(id: @cart_item.item_id)
       redirect_to item_path(@cart_item.item_id), flash: { error: @cart_item.errors.full_messages }
      # render template: "public/items/show"
      # @item = Item.find(params[:id])
    end
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:item_id, :customer_id, :amount)
    end

end
