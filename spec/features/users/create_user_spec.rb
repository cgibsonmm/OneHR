require 'rails_helper'

RSpec.describe 'create user', type: :feature do
  it 'should successfully create' do
    visit new_user_registration_path

    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: '1234567'
    fill_in 'Password confirmation', with: '1234567'
    click_on 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  it 'should fail when invalid' do
    visit new_user_registration_path

    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: '1234567'
    fill_in 'Password confirmation', with: '1234568'
    click_on 'Sign up'

    expect(page).to have_content('1 error')
  end
end
