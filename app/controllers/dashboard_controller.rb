class DashboardController < ApplicationController
  before_action :require_current_user

  def index
    @user = current_user
    @dqs = DqsFacade.current_dqs(@user)
  end
end
