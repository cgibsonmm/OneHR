require 'rails_helper'

RSpec.describe 'Create Requisition', type: :feature do
  context 'logged in as hiring manager' do
    before do
      @hiring_manager = create(:hiring_manager)
      sign_in @hiring_manager
    end

    it 'should create a new requisition' do
      visit '/'
      click_on @hiring_manager.user_name
      within '#dropdown' do
        click_on 'New Requisition'
      end

      expect(page).to have_content('New Requisition')
      @requisition = {  title: Faker::Company.profession,
                        department: Faker::Company.industry,
                        full_time: Faker::Boolean.boolean,
                        preferred_start_date: Faker::Date.between(from: 2.weeks.from_now, to: 1.year.from_now),
                        job_description: Faker::Lorem.paragraphs(number: 3, supplemental: true).join('/n') }

      fill_in 'Title', with: @requisition[:title]
      fill_in 'Department', with: @requisition[:department]
      check 'Full time'
      page.find('.requisition_preferred_start_date').set(@requisition[:preferred_start_date])
      fill_in 'Job description', with: @requisition[:job_description]
      click_on 'Create Requisition'

      expect(page).to have_content('Successfully, created requisition')
      expect(page).to have_content(@requisition[:title])
    end
  end

  context 'logged in as normal user' do
    before do
      @user = create(:user)
      sign_in @user
    end
    it 'should not allow you to create a requisition' do
      visit new_requisition_path
      expect(page).to have_content('You are not authorized to perform this action.')
    end
  end
end
