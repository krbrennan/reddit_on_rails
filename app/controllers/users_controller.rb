class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new

    if @user.save
      redirect to subs_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
