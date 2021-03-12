class ApplicationController < ActionController::Base
  helper_method :current_user #makes method available to view

  def current_user
    unless session[:user_id].nil?
      @user || User.find(session[:user_id])
    end
  end
end
