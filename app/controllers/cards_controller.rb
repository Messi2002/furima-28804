class CardsController < ApplicationController
  def index
    
    def show
      @order = Order.new
      @orders = @item.orders.includes(:user)
    end
    
    redirect_to "/orders/#{order.item.id}" 
  .marge(params[:item_id])
  end
 
  def create
    @items = Item.all
    @card = Card.new(price: card_params[:price])
    if @card.valid?
      pay_item
      @card.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
 
  private
 
  def card_params
    params.permit(:price[:item_id], :token)
  end
 
  def pay_item
      Payjp.api_key = "sk_test_XXXXXXXX"
      Payjp::Charge.create(
      amount: card_params[:price],
      card: card_params[:token],
      currency:'jpy'
    )
  end
end
