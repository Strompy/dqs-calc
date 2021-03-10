require 'rails_helper'

RSpec.describe 'User Login' do
  it 'I can log in from the landing page' do
    user = User.create!(username: 'Gwen', password: 'supersecret')

    visit root_path
    click_on 'Login'
    expect(current_path).to eq(new_session_path)

    fill_in 'user_username', with: user.username
    fill_in 'user_password', with: user.password
    click_on 'Log in'

    expect(current_path).to eq(user_path(user.id))
    expect(page).to have_content("Welcome, #{user.username}!")
  end
  it 'I cannot log in with bad credentials' do
    user = User.create!(username: 'Gwen', password: 'supersecret')

    visit root_path
    click_on 'Login'
    expect(current_path).to eq(new_session_path)

    fill_in 'user_username', with: 'fakename'
    fill_in 'user_password', with: user.password
    click_on 'Log in'

    expect(current_path).to_not eq(user_path(user.id))
    expect(page).to have_content('Incorrect username or password')

    fill_in 'user_username', with: user.username
    fill_in 'user_password', with: 'fakepassword'
    click_on 'Log in'

    expect(current_path).to_not eq(user_path(user.id))
    expect(page).to have_content('Incorrect username or password')
  end
end
