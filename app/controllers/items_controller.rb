class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :destroy, :update]

  def index
    @items = Item.all.order("created_at DESC")
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

  def show
    
  end

  def edit
    if current_user.id != @item.user_id
      return redirect_to root_path
    end
  end

  def update
    if current_user.id == @item.user_id
      @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      if @item.destroy
        redirect_to root_path
      else render :show
      end
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :name, :info, :category_id, :sales_status_id, :scheduled_delivery_id,
      :shopping_fee_status_id, :prefecture_id, :days_to_ship_id, :price, :image
    ).merge(user_id: current_user.id)
  end
end