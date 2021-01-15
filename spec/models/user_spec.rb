require 'rails_helper'

RSpec.describe User, type: :model do
  it 'admin?' do
    @user = build(:user)
    expect(@user.admin?).to be_falsey
    @user = build(:admin_user)
    expect(@user.admin?).to be_truthy
  end

  it 'hiring_manager?' do
    @user = build(:user)
    expect(@user.admin?).to be_falsey
    @user = build(:hiring_manager)
    expect(@user.hiring_manager?).to be_truthy
  end
end
