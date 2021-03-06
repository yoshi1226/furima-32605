class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    if current_user.id == @item.user_id || @item.purchase_record != nil
      return redirect_to root_path
    end
    @pay = Pay.new
  end

  def create
    if current_user.id == @item.user_id || @item.purchase_record != nil
      return redirect_to root_path
    end
    @pay = Pay.new(pay_params)
    if @pay.valid?
      pay_item
      @pay.save
      redirect_to root_path
    else
      render action: :index
    end
  end

private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_params
    params.require(:pay).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id:current_user.id, item_id:params[:item_id], token:params[:token])
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: pay_params[:token],
        currency: 'jpy'
      )
  end
end