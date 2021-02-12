require 'rails_helper'

RSpec.describe Profile, type: :model do
  it 'incomplete_profile? should return true until profile is completed' do
    @profile = build(:profile)
    expect(@profile.incomplete_profile?).to be true
  end
end
