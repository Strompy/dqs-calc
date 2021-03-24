class DqsFacade
  def self.current_dqs(user)
    # get entry data from model
    entries_hash = user.sum_today_by_category
    # use poro to calculate score
    # return score
    DqsPoro.new.calculate(entries_hash)
  end
end
