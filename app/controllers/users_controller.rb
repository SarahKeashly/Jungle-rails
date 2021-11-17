class UsersController < ApplicationController
  def new
  end
  
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      puts "failed"
      redirect_to '/signup', notice:"could not create message"
    end
  end 

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end



end
