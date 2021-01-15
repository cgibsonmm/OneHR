class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :requisitions

  def user_name
    email.split('@')[0]
  end

  def admin?
    role == 'admin'
  end

  def hiring_manager?
    role == 'hiring_manager'
  end
end
