class Auth0Controller < ApplicationController
  def callback
     # example request.env['omniauth.auth'] in https://github.com/auth0/omniauth-auth0#auth-hash
    if @loginUser = User.find_by(image_url: request.env['omniauth.auth']["info"]["image"])
      session[:userinfo] = @loginUser
      redirect_to "/"
    else
      @user = User.new
      @user.name = request.env['omniauth.auth']["info"]["name"]
      @user.email = request.env['omniauth.auth']["info"]["email"]
      @user.image_url = request.env['omniauth.auth']["info"]["image"]
      if @user.save
        session[:userinfo] = @user
        redirect_to "/"
      else
        render "dashboard/error.html.erb"
      end
    end
  end

  def failure
    @error_msg = request.params['message']
  end

end
