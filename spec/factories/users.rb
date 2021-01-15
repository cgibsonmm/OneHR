FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { '1234567' }
    password_confirmation { '1234567' }
    role { 'normal' }

    factory :hiring_manager do
      role { 'hiring_manager' }
    end
    factory :admin_user do
      role { 'admin' }
    end
  end
end
