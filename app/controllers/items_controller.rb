class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:edit, :update, :show, :destroy]

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
  end

  def edit
  end

  def update
    if @items.update(item_params)
      render 'show'
    else
      render 'edit'
    end
  end

  def destroy
    @items.destroy
    redirect_to items_path
  end

  def set_item
    @items = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:item, :introduction, :image, :category_id, :status_id, :price, :postage_payer_id, :preparation_day_id, :ship_location_id).merge(user_id: current_user.id)
  end
end
