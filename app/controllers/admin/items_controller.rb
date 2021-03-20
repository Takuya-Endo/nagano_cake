class Admin::ItemsController < ApplicationController

    def new
      @item = Item.new
    end

    def create
      item = Item.new(item_params)
      item.save
      redirect_to root_path
    end

    private
      def item_params
        params.require(:list).permit(:image, :name, :introduction, :price)
      end

end
