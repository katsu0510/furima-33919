class OrdersController < ApplicationController
  before_action :authenticate_user!, only:[:index, :create]
  before_action :set_item, only:[:index, :create]
  before_action :order_self, only:[:index, :create]
  before_action :order_sold, only:[:index, :create]

  def index
    @order_destination = OrderDestination.new
   
  end

  def create
    @order_destination = OrderDestination.new(order_params)
 
    if @order_destination.valid?
      pay_item
      @order_destination.save
      return redirect_to root_path
    else
      render 'index'
    end

  end

  private

  def order_params
    params.require(:order_destination).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :name, :description, :category_id, :state_id, :ship_cost_id, :prefecture_id, :ship_day_id).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],    
      currency: 'jpy'              
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_self
    if current_user == @item.user
      redirect_to root_path
    end
  end
  def order_sold
    if @item.order.present? 
      redirect_to root_path
    end
  end

end
