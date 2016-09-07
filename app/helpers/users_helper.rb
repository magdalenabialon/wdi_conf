module UsersHelper

  def current_user(user)
    User.find_by(id: user.id)
  end

end
