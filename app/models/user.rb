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
    require "pry"; binding.pry
    # grab todays entries grouped by category
    groups = entries.where(created_at: Date.today.all_day)
    # iterate through groups to calculate based on category
    groups.each do |category, quantity|
      case category
      when 'Fruits', 'Vegetables'
        # helper method?
      when 'High-Quality Meat/Seafoods', 'Legumes, Plant Protein', 'Nuts, Seeds, Healthy Oils', 'Whole Grains'
        # helper method?
      when 'Dairy'
        # helper method?
      when 'High-Quality Beverages'
        # helper method?
      when 'High-Quality Processed Foods'
        # helper method?
      when 'Refined Grains', 'Low-Quality Meat/Seafoods'
        # helper method?
      when 'Sweets', 'Fried Foods', 'Low-Quality Beverages'
        # helper method?
      when 'Low-Quality Meat/Seafoods'
        # helper method?
      end
    end
    # case statement may be most helpful

  end
end
