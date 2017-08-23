class DashboardsController < ApplicationController

  def index
    @user = User.find(session[:user_id])
  end

  def show
      @to_sell = Shoe.where(seller: current_user, buyer: nil)
      @sold = current_user.sellers.where.not(buyer: nil)
      @purchase = Shoe.where(buyer: current_user)
      @total_purchase = Shoe.where(buyer: current_user).sum(:price)
      @total_sold = current_user.sellers.where.not(buyer: nil).sum(:price)
  end

end
