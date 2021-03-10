class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: user_params[:username])
    if @user != nil && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.username}!"
      redirect_to user_path(@user.id)
    else
      flash[:error] = 'Incorrect username or password. Please try again or sign up for an account.'
      @user = User.new(username: user_params[:username])
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
