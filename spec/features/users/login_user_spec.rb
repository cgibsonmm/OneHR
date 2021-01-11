require 'rails_helper'

RSpec.describe 'Login User', type: :feature do
  it 'Should login user' do
    user = User.create!(email: '123e@gmail.com', password: '124567', password_confirmation: '124567')
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    expect(page).to have_content('Signed in successfully')
  end
end
