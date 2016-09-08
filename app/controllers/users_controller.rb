class UsersController < ApplicationController

  def delete
    session[:userinfo] = nil;
    redirect_to '/'
  end

end
