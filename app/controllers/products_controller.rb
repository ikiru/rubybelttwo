class ProductsController < ApplicationController

def index
  @shoes = Shoe.where.not(seller:  [current_user])

end

def create
  @shoe = Shoe.new(shoe_params)
  if @shoe.valid?
      @shoe.save
      flash[:notice] = ["That was saved, way to go."]

      return redirect_to :back
  end
  flash[:errors] = @shoe.errors.full_messages

  return redirect_to :back
end

def destroy
  shoe = Shoe.find(params[:id])
  shoe.destroy if current_user == shoe.seller
  redirect_to :back
end

def purchased
  Shoe.find(params[:id]).update(buyer: current_user)
  redirect_to :back
end


private
  def shoe_params
    params.require(:shoe).permit(:product, :price).merge(seller: current_user)
  end
end
