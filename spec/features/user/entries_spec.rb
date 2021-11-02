require 'rails_helper'

RSpec.describe 'Meal Entries' do
  it 'As user I can add entries from the dashboard' do
    user = User.create!(username: 'Gwen', password: 'supersecret')
    expect(user.entries.size).to eq(0)

    sign_in_as(user)

    expect(current_path).to eq(dashboard_index_path)

    expect(page).to have_link('Add Food')
    click_on 'Add Food'

    expect(current_path).to eq(new_user_entry_path(user.id))
    expect(page).to have_select(:entry_meal_type)
    expect(page).to have_select(:entry_category)
    expect(page).to have_select(:entry_serving)

    select('Lunch', from: 'entry_meal_type')
    select('Vegetables', from: 'entry_category')
    select('1', from: 'entry_serving')

    click_on 'Submit'

    expect(current_path).to eq(dashboard_index_path)
    expect(page).to have_content('New entry was successfully created')

    user.reload
    expect(user.entries.size).to eq(1)
  end
  it 'As user I can add different entries from the dashboard' do
    user = User.create!(username: 'Gwen', password: 'supersecret')
    expect(user.entries.size).to eq(0)

    sign_in_as(user)

    expect(current_path).to eq(dashboard_index_path)

    expect(page).to have_link('Add Food')
    click_on 'Add Food'

    expect(current_path).to eq(new_user_entry_path(user.id))
    expect(page).to have_select(:entry_meal_type)
    expect(page).to have_select(:entry_category)
    expect(page).to have_select(:entry_serving)

    select('Breakfast', from: 'entry_meal_type')
    select('Fruits', from: 'entry_category')
    select('1.5', from: 'entry_serving')

    click_on 'Submit'

    expect(current_path).to eq(dashboard_index_path)
    expect(page).to have_content('New entry was successfully created')

    user.reload
    expect(user.entries.size).to eq(1)
  end
  it 'As user I can add back-to-back entries from the dashboard' do
    user = User.create!(username: 'Gwen', password: 'supersecret')
    expect(user.entries.size).to eq(0)

    sign_in_as(user)

    expect(current_path).to eq(dashboard_index_path)

    expect(page).to have_link('Add Food')
    click_on 'Add Food'

    expect(current_path).to eq(new_user_entry_path(user.id))
    expect(page).to have_select(:entry_meal_type)
    expect(page).to have_select(:entry_category)
    expect(page).to have_select(:entry_serving)

    select('Breakfast', from: 'entry_meal_type')
    select('Fruits', from: 'entry_category')
    select('1.5', from: 'entry_serving')

    click_on 'Submit'

    expect(current_path).to eq(dashboard_index_path)
    expect(page).to have_content('New entry was successfully created')

    user.reload
    expect(user.entries.size).to eq(1)

    click_on 'Add Food'

    expect(current_path).to eq(new_user_entry_path(user.id))
    expect(page).to have_select(:entry_meal_type)
    expect(page).to have_select(:entry_category)
    expect(page).to have_select(:entry_serving)

    select('Breakfast', from: 'entry_meal_type')
    select('Fruits', from: 'entry_category')
    select('1.5', from: 'entry_serving')

    click_on 'Submit'

    expect(current_path).to eq(dashboard_index_path)
    expect(page).to have_content('New entry was successfully created')

    user.reload
    expect(user.entries.size).to eq(2)
  end
end
