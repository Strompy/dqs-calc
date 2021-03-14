class EntriesController < ApplicationController
  before_action :require_current_user

  def new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    entry = @user.entries.new(entry_params)
    if entry.save
      flash[:success] = 'New entry was successfully created'
      redirect_to dashboard_index_path
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:meal_type, :category, :serving)
  end
end
