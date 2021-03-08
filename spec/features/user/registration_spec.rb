require 'rails_helper'

RSpec.describe 'User Registration' do
  it 'I can get to registration form from Welcome' do
    visit root_path
    click_on 'Sign up'
    expect(current_path).to eq(new_user_path)
    expect(page).to have_field('Username')
    expect(page).to have_field('Password')
    expect(page).to have_field('Password Confirmation')
  end
end
