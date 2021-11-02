require 'rails_helper'

RSpec.describe 'User Dashboard/Show Page' do
  it 'As a logged in user I can access the dashboard' do
    user = User.create!(username: 'Gwen', password: 'supersecret')
    sign_in_as(user)

    expect(current_path).to eq(dashboard_index_path)
    expect(page).to have_content("#{user.username}'s dashboard")
    expect(page).to have_css('.today')
    expect(page).to have_css('.recommended')
    expect(page).to have_css('.stats')
  end
  it 'Shows todays entries on the dashboard' do
    user = User.create!(username: 'Gwen', password: 'supersecret')
    user.entries.create!(meal_type: 'Breakfast', category: 'Fruits', serving: 1.5)
    user.entries.create!(meal_type: 'Breakfast', category: 'Fruits', serving: 1)
    user.entries.create!(meal_type: 'Lunch', category: 'Vegetables', serving: 1)
    sign_in_as(user)

    # daily log
    expect(page).to have_content("Breakfast")
    expect(page).to have_content("Fruits")
    expect(page).to have_content("2.5")
    # daily score
    expect(page).to have_content("Today's Score: 7.0")
  end
end
