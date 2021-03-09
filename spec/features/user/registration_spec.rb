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
  it 'I cannot create a user with mismatched passwords' do
    visit new_user_path
    fill_in 'user_username', with: 'Gwen'
    fill_in 'user_password', with: 'password1'
    fill_in 'user_password_confirmation', with: 'dontguessme'
    click_on 'Submit'

    user = User.first
    expect(user).to be nil
    expect(User.count).to eq(0)

    expect(current_path).to eq(users_path)
    expect(find_field(:user_username).value).to eq('Gwen')
    expect(find_field(:user_password).value).to be nil
    expect(find_field(:user_password_confirmation).value).to be nil
    expect(page).to have_content("Password confirmation doesn't match Password")

  end
  it 'I cannot create a user with non-unqiue username' do
    user = User.create!(username: 'Gwen', password: 'tri')
    expect(User.count).to eq(1)

    visit new_user_path
    fill_in 'user_username', with: 'Gwen'
    fill_in 'user_password', with: 'password1'
    fill_in 'user_password_confirmation', with: 'password1'
    click_on 'Submit'

    expect(User.count).to eq(1)

    expect(current_path).to eq(users_path)
    expect(find_field(:user_username).value).to eq('Gwen')
    expect(find_field(:user_password).value).to be nil
    expect(find_field(:user_password_confirmation).value).to be nil

    expect(page).to have_content('Username has already been taken')
  end
end
