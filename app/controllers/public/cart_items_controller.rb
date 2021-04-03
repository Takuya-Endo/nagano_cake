class Public::CartItemsController < ApplicationController
  def index
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)

      @cart_item.customer_id = current_customer.id
      @cart_item.item_id = @item

    @cart_item.save
    redirect_to root_path
  end

  private
    def cart_item_params
      params.permit(:item_id, :customer_id, :amount)
    end

end
