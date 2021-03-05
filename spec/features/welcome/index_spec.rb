require 'rails_helper'

RSpec.describe 'Welcome Page Index Page Spec' do
  it 'I can visit the welcome page' do
    visit root_path
    expect(page).to have_content('Welcome to DQS Calc!')
  end
end
