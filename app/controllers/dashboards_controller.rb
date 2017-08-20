class DashboardsController < ApplicationController

  def index
    @user = User.find(session[:user_id])
  end

  def show
    @user = current_user

  end



end
