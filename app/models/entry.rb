class Entry < ApplicationRecord
  validates :meal_type, presence: true
  validates :category, presence: true
  validates :serving, presence: true

  belongs_to :user

  MEAL_TYPES = ['Breakfast', 'Lunch', 'Dinner', ' Snacks', 'Beverages']
end
