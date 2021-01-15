require 'rails_helper'

RSpec.describe 'Dashboard', type: :feature do
  before do
    @user = create(:user)
    sign_in @user
  end
  it 'shows the right context' do
    visit dashboard_index_path
    count = page.all('.card').length
    expect(count).to be(4)
  end
end
