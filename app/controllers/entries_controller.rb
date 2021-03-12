class EntriesController < ApplicationController
  before_action :require_current_user

  def new
    require "pry"; binding.pry
  end
end
