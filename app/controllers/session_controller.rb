class SessionController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      session[:user_id] = @user.id
      redirect_to '/dashboard'
    else
      redirect_to '/users'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
