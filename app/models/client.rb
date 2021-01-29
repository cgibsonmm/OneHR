class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile
  after_save :create_empty_profile, if: :create

  private

  def create_empty_profile
    @profile = profile.build
    @profile.save
  end
end
