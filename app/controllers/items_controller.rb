class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)

    if @items.save(item_prams)
      #Item.create(item_params)
      redirect to items_path
    else
      render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:item, :introduction, :image, :category_id, :status_id, :price, :postage_payer_id, :preparation_day_id, :ship_location_id).merge(user_id: current_user.id)
  end
end
