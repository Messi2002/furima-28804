class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)

    if @items.valid?
      @items.save
      redirect_to items_path
    else
      render 'new'
    end
  end

  def show
    @items = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:item, :introduction, :image, :category_id, :status_id, :price, :postage_payer_id, :preparation_day_id, :ship_location_id).merge(user_id: current_user.id)
  end
end
