class UsersController < ApplicationController
  def new
  end

  def create
    # Somewhere here we have to figure out how to bcrypt password
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password_digest)
  end
end
