class UsersController < ApplicationController
  def new
  end

  def create 
    @user = User.new(user_params)
    if @user.save 
      flash[:success] = "User created."
    else 
      flash[:error] = "#{@user.errors.full_messages.to_sentence}"
    end 
    redirect_to users_new_path
  end 

  def user_params
    params.require(:user).permit(:code, :name, :email, :password, :password_confirmation)
  end 
end
