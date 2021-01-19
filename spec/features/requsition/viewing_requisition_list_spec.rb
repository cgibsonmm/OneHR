require 'rails_helper'

RSpec.describe 'Viewing Requisition Index', type: :feature, js: true do
  before do
    @number = (0...100).to_a.sample
    @user1 = create(:hiring_manager)
    @user2 = create(:hiring_manager)
    30.times do
      create(:requisition, user: @user2)
    end
    @number.times do
      create(:requisition, user: @user1)
    end
  end
  context 'signed in as user' do
    before do
      sign_in @user1
      @r = Requisition.where(user: @user1)
    end
    it 'should display a list of requisitions assigned to that user' do
      visit '/'
      first(:link, 'Dashboard').click
      click_on 'My Reqs'
      expect(page).to have_selector(".requisition-#{@r.sample[:id]}")
      expect(page).to have_selector('.requisition-line', count: @r.length)
    end
  end

  context 'Logged in as admin' do
    before do
      @admin = create(:admin_user)
      login_as @admin
      @reqs = Requisition.all.length
    end

    it 'should show a list of all requisitions' do
      visit 'requisitions'
      expect(page).to have_selector('.requisition-line', count: @r)
    end
  end
end
