require 'rails_helper'

RSpec.describe 'Landing Page Index Page Spec' do
  it 'I can visit the landing page' do
    visit root_path
    expect(page).to have_content('Welcome to DQS Calc!')
  end
end
