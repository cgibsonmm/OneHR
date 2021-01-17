require 'rails_helper'

RSpec.describe Requisition, type: :model do
  before do
    @requisition = build(:requisition)
  end
  it 'should be valid' do
    expect(@requisition).to be_valid
  end
  it 'should validate title present' do
    @requisition.title = nil
    expect(@requisition).not_to be_valid
  end
  it 'should validate title is at least 4 chars' do
    @requisition.title = 'aaa'
    expect(@requisition).not_to be_valid
    @requisition.title = 'aaaa'
    expect(@requisition).to be_valid
  end
  it 'should validate department is present' do
    @requisition.department = ''
    expect(@requisition).not_to be_valid
  end
  it 'should validate department is at least 4 chars' do
    @requisition.department = 'aaa'
    expect(@requisition).not_to be_valid
    @requisition.department = 'aaaa'
    expect(@requisition).to be_valid
  end
  it 'should validate preferred starting date present' do
    @requisition.preferred_start_date = ''
    expect(@requisition).not_to be_valid
  end
  it 'should validate preferred starting date greater than today'
end
