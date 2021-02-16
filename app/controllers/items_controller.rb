class ItemsController < ApplicationController

  before_action :authenticate_user!, except:[:index, :show ]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :security, only: [:edit, :update]

  def index
    @items = Item.order("created_at DESC")
  end

  def new 
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end


  def update
    if @item.update(item_params)
       redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
  end

  def show
  end






private

def move_to_index  
  unless user_signed_in?
    redirect_to action: :index
  end
end

def item_params
  params.require(:item).permit(:name, :description, :category_id, :state_id, :ship_cost_id, :prefecture_id, :ship_day_id, :price, :image).merge(user_id: current_user.id)
end

def set_item
  @item = Item.find(params[:id])
end

def security
  unless current_user == @item.user
    redirect_to action: :index
  end
end


end
