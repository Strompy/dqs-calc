require 'rails_helper'

RSpec.describe 'User Dashboard/Show Page' do
  it 'As a logged in user I can access the dashboard' do
    user = User.create!(username: 'Gwen', password: 'supersecret')
    visit new_session_path
    fill_in 'user_username', with: user.username
    fill_in 'user_password', with: user.password
    click_on 'Log in'

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

    visit new_session_path
    fill_in 'user_username', with: user.username
    fill_in 'user_password', with: user.password
    click_on 'Log in'

    # daily log
    expect(page).to have_content("Breakfast")
    expect(page).to have_content("Fruits")
    expect(page).to have_content("2.5")
    # daily score
    expect(page).to have_content("Today's Score: 7.0")
  end

end
