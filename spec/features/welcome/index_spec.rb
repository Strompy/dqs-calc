require 'rails_helper'

RSpec.describe 'Welcome Page Index Page' do
  it 'I can visit the welcome page' do
    visit root_path
    expect(page).to have_content('Welcome to DQS Calc!')
  end
  it 'has a user registration link' do
    visit root_path
    expect(page).to have_link('Sign up')
  end
end
