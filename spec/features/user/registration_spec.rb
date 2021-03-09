require 'rails_helper'

RSpec.describe 'User Registration' do
  it 'I can get to registration form from Welcome' do
    visit root_path
    click_on 'Sign up'
    expect(current_path).to eq(new_user_path)
    expect(page).to have_field('user_username')
    expect(page).to have_field('user_password')
    expect(page).to have_field('user_password_confirmation')
  end
  it 'I can create a new user' do
    visit new_user_path
    fill_in 'user_username', with: 'Gwen'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Submit'

    user = User.first
    expect(user.username).to eq 'Gwen'
    expect(user.password_digest).to_not be nil

    expect(current_path).to eq(user_path(user.id))
  end
end
