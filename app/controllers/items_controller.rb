class ItemsController < ApplicationController

  before_action :move_to_index, except: [:index, :show, :new]
  before_action :authenticate_user!, only:[:new, :edit, :destroy ]
  before_action :set_item, only: [:show]

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
  end

  def destroy
  end

  def show
  end

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

