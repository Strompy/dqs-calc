class WelcomeController < ApplicationController
  def index
    unless session[:user_id].nil?
      redirect_to dashboard_index_path
    end
  end
end
