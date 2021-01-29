require 'rails_helper'

RSpec.describe 'Client', type: :feature do
  it 'should be able to sign up for an account' do
    visit '/sign-up'
    expect(page).to have_content('Sign up')

    fill_in 'Email', with: 'client1@email.com'
    fill_in 'Password', with: '1234567'
    fill_in 'Password confirmation', with: '1234567'
    click_on 'Sign up'

    expect(page).to have_content('successfully')
  end

  it 'should direct you to client profile if incomplete' do
    visit '/sign-up'
    expect(page).to have_content('Sign up')

    fill_in 'Email', with: 'client1@email.com'
    fill_in 'Password', with: '1234567'
    fill_in 'Password confirmation', with: '1234567'
    click_on 'Sign up'

    expect(current_path).to equal('/my-profile')
    expect(page).to have_content 'Profile'
  end
end
