class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @sell_item =SellItem.new
    # @orders = @item.orders.includes(:user)
  end

  def new
  end

  def create
     @sell_item = SellItem.new(sell_params)  
     @item = Item.find(params[:item_id])
     if @sell_item.valid?
       @sell_item.save
       redirect_to root_path
     else
       render :index
     end
  end

  def sell_params
    params.require(:sell_item).permit(:postal_code, :delivery_area_id, :city, :address, :building_name, :phone_number,:purchase_management_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
