FactoryBot.define do
  factory :user do
    email { Faker::Internet.safe_email }
    password { '1234567' }
    password_confirmation { '1234567' }

    trait :hiring_manager do
      after(:create) { |user| user.add_role :hiring_manager }
    end
  end
end
