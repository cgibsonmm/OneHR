require 'rails_helper'

RSpec.describe 'Viewing a Requisition' do
  context 'not logged in' do
    before do
      @req = create(:requisition)
    end

    it 'should show the view of the requisition' do
      visit "/requisitions/#{@req.id}"
      expect(page).to have_content(@req.title)
      expect(page).to have_content(@req.department)
      expect(page).to have_content(@req.description)
    end
  end
end
