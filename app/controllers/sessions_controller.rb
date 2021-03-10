class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    require "pry"; binding.pry
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
