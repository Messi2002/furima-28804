class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_order, only: [:index, :create]
  def index
    if @items.purchase != nil || current_user.id == @items.user_id 
      redirect_to items_path
    end
    @order = PurchaseOrder.new 
  end
  
  def create
    @order = PurchaseOrder.new(order_params)
   
    if @order.save
      pay_item
      redirect_to root_path
    else
      render 'index'
    end
   
  end
  private
  def set_order
    @items = Item.find(params[:item_id])
  end

  def pay_item
      Payjp.api_key = "sk_test_84f6a2fd96f9c172ba08616d"
      Payjp::Charge.create(
      amount: @items.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end
  def order_params
   
    params.permit(:postal_code, :prefecture, :city, :house_number, :building_name, :phone_number,:token,:item_id).merge(user_id: current_user.id)
                    
  end
  
end
