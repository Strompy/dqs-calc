require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe 'validations' do
    it { should validate_presence_of :meal_type }
    it { should validate_presence_of :category }
    it { should validate_presence_of :serving }
  end
  describe 'relationships' do
    it { should belong_to :user }
  end
end
