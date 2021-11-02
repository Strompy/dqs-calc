class User < ApplicationRecord
  validates :username, uniqueness: true, presence:true
  validates_presence_of :password_digest, require: true
  has_many :entries, dependent: :destroy

  has_secure_password

  def today_by_category(meal_type)
    entries.where(created_at: Date.current.all_day) #in rails use `.current` for DB queries. DB uses UTC
      .where(meal_type: meal_type)
      .group("category")
      .sum("serving")
  end

  def sum_today_by_category
    # rework the names for these methods
    # require "pry"; binding.pry
    entries.where(created_at: Date.current.all_day)
      .group("category")
      .sum("serving")
  end


end
