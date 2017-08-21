class UsersController < ApplicationController
  skip_before_action :require_login, only: [:create, :index]

  def index
  end

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      session[:user_id] = user.id
      flash[:notice] = ["Registered Successfully"]
      return redirect_to '/'
    else
      flash[:errors] = user.errors.full_messages
      return redirect_to :back
    end
  end


  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
    end

    def auth
      return redirect_to '/' unless session[:user_id].to_s == params[:id]
    end
end
