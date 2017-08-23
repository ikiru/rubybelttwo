class DashboardsController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @shoes = Shoe.where(buyer:nil)
    @sold = Shoe.includes(:buyer).where.not(buyer:nil)
    @purchase = Shoe.where(buyer:current_user)
    @total_purchase = Shoe.where(buyer: current_user).sum(:price)
		@total_sold = current_user.sellers.where.not(buyer: nil).sum(:price)

  end

  def create
    @shoe = Shoe.new(shoe_params)
    if @shoe.valid?
        @shoe.save
        flash[:notice] = ["Posted Successfully"]

        return redirect_to :back
    end
    flash[:errors] = @shoe.errors.full_messages

    return redirect_to :back
  end

  def show
      @to_sell = Shoe.where(seller: current_user, buyer: nil)
      @sold = current_user.sellers.where.not(buyer: nil)
      @purchase = Shoe.where(buyer: current_user)
      @total_purchase = Shoe.where(buyer: current_user).sum(:price)
      @total_sold = current_user.sellers.where.not(buyer: nil).sum(:price)
  end

  def buy
    Shoe.find(params[:id]).update(buyer: current_user)
		redirect_to :back
  end

  def destroy
  shoe = Shoe.find(params[:id])
  shoe.destroy if current_user == shoe.seller
  redirect_to :back
end

  private
    def shoe_params
      params.require(:shoe).permit(:product, :price).merge(seller: current_user)
    end
end
