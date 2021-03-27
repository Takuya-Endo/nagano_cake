class Admin::ItemsController < ApplicationController

    def new
      @item = Item.new
    end

    def create
      item = Item.new(item_params)
      item.save
      redirect_to root_path
    end

    def index
      @items = Item.all
    end

    def show
      @item = Item.find(params[:id])
    end

    private
      def item_params
        params.require(:item).permit(:image, :name, :introduction, :price)
      end

end
