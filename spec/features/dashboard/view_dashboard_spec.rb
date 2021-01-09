require 'rails_helper'

RSpec.describe 'Dashboard', type: :feature do
  it 'shows the right context' do
    visit dashboard_index_path
    expect(page).to have_content 'My Dash'
  end
end
