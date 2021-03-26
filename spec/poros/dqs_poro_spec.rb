require 'rails_helper'

RSpec.describe DqsPoro do
  it 'can instatiate with attributes' do
    poro = DqsPoro.new

    expected = {
      'Fruits' => [1, 1, 1, 1, 1, 1, 0.5, 0.5, 0, 0, 0, 0],
      'Vegetables' => [1, 1, 1, 1, 1, 1, 0.5, 0.5, 0, 0, 0, 0],
      'Lean Meats & Fish' => [1, 1, 1, 1, 0.5, 0.5, 0, 0, 0, 0, -0.5, -0.5],
      'Nuts & Seeds' => [1, 1, 1, 1, 0.5, 0.5, 0, 0, 0, 0, -0.5, -0.5],
      'Whole Grains' => [1, 1, 1, 1, 0.5, 0.5, 0, 0, 0, 0, -0.5, -0.5],
      'Dairy' => [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0, 0, -0.5, -0.5, -1, -1],
      'Refined Grains' => [-0.5, -0.5, -0.5, -0.5, -1, -1, -1, -1, -1, -1, -1, -1],
      'Fatty Proteins' => [-0.5, -0.5, -0.5, -0.5, -1, -1, -1, -1, -1, -1, -1, -1],
      'Sweets' => [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
      'Fried Foods' => [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
    }

    expect(poro).to be_instance_of(DqsPoro)
    expect(poro.tables).to eq(expected)
  end
  it 'can calculate todays dqs' do
    poro = DqsPoro.new
    user = User.create!(username: 'Gwen', password: 'supersecret')
    user.entries.create!(meal_type: 'Breakfast', category: 'Fruits', serving: 1.5)
    user.entries.create!(meal_type: 'Breakfast', category: 'Fruits', serving: 1)
    user.entries.create!(meal_type: 'Lunch', category: 'Vegetables', serving: 1)

    expect(user.entries.size).to eq(3)
    entries_hash = user.sum_today_by_category
    expect(poro.calculate(entries_hash)).to eq(7)
  end

end
