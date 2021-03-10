class WelcomeController < ApplicationController
  def index
    unless session[:user_id].nil?
      redirect_to user_path(session[:user_id])
    end
  end
end
