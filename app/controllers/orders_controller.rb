class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    # @orders = @item.orders.includes(:user)
  end

  def new
  end

  def create
  end

end
