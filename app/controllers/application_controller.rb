class ApplicationController < ActionController::Base
  helper_method :current_user #makes method available to view

  def current_user
    unless session[:user_id].nil?
      @user || User.find(session[:user_id])
    end
  end

  private

  def require_current_user
    unless current_user
      redirect_to root_path
    end
  end
end
