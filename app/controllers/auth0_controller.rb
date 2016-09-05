class Auth0Controller < ApplicationController
  def callback
     # example request.env['omniauth.auth'] in https://github.com/auth0/omniauth-auth0#auth-hash
    # id_token = session[:userinfo]['credentials']['id_token']
    # store the user profile in session and redirect to root
    # session[:userinfo] = request.env['omniauth.auth']
    @loginUser = User.find_by(email: request.env['omniauth.auth']["info"]["email"])
    if @loginUser
      @user = @loginUser
      render "dashboard/show.html.erb"
    else
      if request.env['omniauth.auth']["info"]["email"] == nil
        render "dashboard/error.html.erb"
      else
        @user = User.new
        @user.name = request.env['omniauth.auth']["info"]["name"]
        @user.email = request.env['omniauth.auth']["info"]["email"]
        @user.image_url = request.env['omniauth.auth']["info"]["image"]
        if @user.save
          # render "dashboard/show.html.erb"
          redirect_to '/'
        else
          render "dashboard/error.html.erb"
        end
      end
    end
    # render "dashboard/show.html.erb"
  end

  def failure
    @error_msg = request.params['message']
  end

end
