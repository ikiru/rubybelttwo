class SessionsController < ApplicationController
  # skip_before_action :require_login, only: [:create]

def create
    user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    if user
        session[:user_id] = user.id
        return redirect_to "/dashboard"
    else
        flash[:errors] = ['Too Too Bad, So Sad. This Combo will not work']
        return redirect_to :back
    end
end

  def destroy
      session[:user_id] = nil
      return redirect_to '/'
  end
end
