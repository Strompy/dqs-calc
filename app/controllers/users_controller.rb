class UsersController < ApplicationController
  def show
    # require "pry"; binding.pry
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome, #{@user.username}!"
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
