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
  it 'As user I can add entries from the dashboard' do
    user = User.create!(username: 'Gwen', password: 'supersecret')
    visit new_session_path
    fill_in 'user_username', with: user.username
    fill_in 'user_password', with: user.password
    click_on 'Log in'

    expect(current_path).to eq(dashboard_index_path)

    expect(page).to have_link('Add Food')
    click_on 'Add Food'
save_and_open_page
    expect(current_path).to eq(new_user_entry_path(user.id))
    expect(page).to have_field('Meal Type')
    expect(page).to have_field('Food Category')
    expect(page).to have_field('Serving Size')
  end
end
