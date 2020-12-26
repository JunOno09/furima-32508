class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @sell_item =SellItem.new
    if current_user == @item.user ||@item.purchase_management.present?
       redirect_to root_path
    end
  end

  def new
  end

  def create
     @item = Item.find(params[:item_id])
     @sell_item = SellItem.new(sell_params)  
     if @sell_item.valid? 
      pay_item
       @sell_item.save
       redirect_to root_path
     else
       render :index
     end
     
  end


  private

  def sell_params
    params.require(:sell_item).permit(:postal_code, :delivery_area_id, :city, :address, :building_name, :phone_number,:purchase_management_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

 def pay_item
   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
   Payjp::Charge.create(
   amount: @item.price,
   card: sell_params[:token],  
   currency: 'jpy'               
   )
  end

end
