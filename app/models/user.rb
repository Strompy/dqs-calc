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
      when 'Lean Meats & Fish', 'Nuts & Seeds', 'Whole Grains'
        # helper method?
      when 'Dairy'
        # helper method?
      when 'Refined Grains'
        # helper method?
      when 'Sweets', 'Fried Foods'
        # helper method?
      when 'Fatty Proteins'
        # helper method?
      # add else?
      end
    end

  end


end
