class Entry < ApplicationRecord
  validates :meal_type, presence: true
  validates :category, presence: true
  validates :serving, presence: true

  belongs_to :user

  MEAL_TYPES = ['Breakfast', 'Lunch', 'Dinner', ' Snacks', 'Beverages']
  CATEGORIES = ['Fruits', 'Vegetables', 'Lean Meats & Fish', 'Nuts & Seeds', 'Whole Grains', 'Dairy', 'Refined Grains', 'Sweets', 'Fried Foods', 'Fatty Proteins']
end
