class DqsFacade
  def self.current_dqs(user)
    # get entry data from model
    require "pry"; binding.pry
    user.sum_today_by_category
    # use poro to calculate score
    # return dqs number
  end
end
