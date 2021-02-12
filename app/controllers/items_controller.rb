class ItemsController < ApplicationController

  before_action :move_to_index, except: [:index, :show, :new]
 

  def index
    @items = Item.order("created_at DESC")
  end

  def new 
    authenticate_user!
    @items = Item.all
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
  params.permit(:name, :description, :category, :state_id, :ship_cost_id, :prefecture_id, :ship_day_id, :user, :price, :image).merge(user_id: current_user.id)
end