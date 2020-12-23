class OrdersController < ApplicationController
  def index
    @ordres = Order.includes(:user)
  end
end
