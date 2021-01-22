require 'rails_helper'

RSpec.describe 'Viewing a Requisition' do
  context 'logged in hiring manager' do
    before do
      @user = create(:hiring_manager)
      5.times do
        create(:requisition, user: @user)
      end
      sign_in @user
    end

    it 'should be able to view requisition' do
      @reqs = @user.requisitions
      visit '/dashboard/index'
      expect(page).to have_content("My Reqs #{@reqs.length}")
      click_on('My Reqs')
      click_on @reqs[1].title
      expect(page).to have_content(@reqs[1].title)
      expect(page).not_to have_content(@reqs[2].title)
    end
  end
end
