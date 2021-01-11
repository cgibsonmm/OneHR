require 'rails_helper'

RSpec.describe 'Create Requisition', type: :feature, js: true do
  context 'logged in as hiring manager' do
    before do
      @hiring_manager = create(:user, :hiring_manager)
      sign_in @hiring_manager
    end

    it 'should create a new requisition' do
      visit '/'
      click_on @hiring_manager.user_name
      save_and_open_page
      within '#dropdown' do
        click_on 'New Requsition'
      end

      expect(page).to have_content('New Requisition')
      @requisition = {  title: Faker::Company.profession,
                        department: Faker::Company.industry,
                        full_time: Faker::Boolean.boolean,
                        preferred_start_date: Faker::Date.between(from: 2.weeks.from_now, to: 1.year.from_now),
                        job_description: Faker::Lorem.paragraphs(number: 3, supplemental: true).join('/n') }

      fill_in 'Title', with: @requisition[:title]
      fill_in 'Department', with: @requisition[:department]
      fill_in 'Full Time', with: @requisition[:full_time]
      fill_in 'Preferred Start Date', with: @requisition[:preferred_start_date]
      fill_in 'Job Description', with: @requisition[:job_description]
      click_on 'Create Requisition'

      expect(page).to have_content('Successfully, created requisition')
    end
  end
end
