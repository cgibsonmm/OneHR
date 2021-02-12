require 'rails_helper'

RSpec.describe 'Create Client Profile' do
  context 'new client' do
    before do
      @client = create(:client)
      sign_in @client
    end
    it 'should redirect redirect here on create and not complete' do
      puts current_path
    end
  end
end
