require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of :username}
    it {should validate_uniqueness_of :username}
    it {should validate_presence_of :password}
  end
  describe 'relationships' do
    it { should have_many :entries }
  end

  describe 'instance_methods' do
    it 'can find todays entryies sorted by category per meal_type' do
      user = User.create!(username: 'Gwen', password: 'supersecret')
      user.entries.create!(meal_type: 'Breakfast', category: 'Fruits', serving: 1.5)
      user.entries.create!(meal_type: 'Breakfast', category: 'Fruits', serving: 1)
      user.entries.create!(meal_type: 'Lunch', category: 'Vegetables', serving: 1)

      result = user.today_by_category('Breakfast')
      expected = {"Fruits" => 2.5}
      expect(result).to eq(expected)

      result = user.today_by_category('Lunch')
      expected = {"Vegetables" => 1}
      expect(result).to eq(expected)

      result = user.today_by_category('Dinner')
      expected = {}
      expect(result).to eq(expected)
    end
  end
end
