class User < ApplicationRecord
  validates :username, uniqueness: true, presence:true
  validates_presence_of :password_digest, require: true
  has_many :entries, dependent: :destroy

  has_secure_password

  def today_by_category(meal_type)
    entries.where(created_at: Date.today.all_day)
      .where(meal_type: meal_type)
      .group("category")
      .sum("serving")
  end

  def dqs
    score = 0
    require "pry"; binding.pry
    # grab todays entries grouped by category
    groups = entries.where(created_at: Date.today.all_day)
    # iterate through groups to calculate based on category
    groups.each do |category, quantity|
      case category
      when 'Fruits', 'Vegetables'
        # helper method?
        # score += fruit_veg_calc(quantity)
      when 'Lean Meats & Fish', 'Nuts & Seeds', 'Whole Grains'
        # helper method?
        # score += meat_seeds_grains_calc(quantity)
      when 'Dairy'
        # helper method?
        # score += dairy_calc(quantity)
      when 'Refined Grains', 'Fatty Proteins'
        # helper method?
        # score += refined_grains_fatty_calc(quantity)
      when 'Sweets', 'Fried Foods'
        # helper method?
        # score += fried_sweets_calc(quantity)
      # add else?
      end
    end

  end


end
