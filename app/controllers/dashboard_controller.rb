class DashboardController < ApplicationController
  before_action :require_current_user

  def index;
  end

  private

  def require_current_user
    unless current_user
      redirect_to root_path
    end
  end
end
