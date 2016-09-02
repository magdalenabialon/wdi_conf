class DashboardController < ApplicationController
  def show
    @user = session[:userinfo]
  end
end
