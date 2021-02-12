FactoryBot.define do
  factory :client do
    email { Faker::Internet.email }
    password { '1234567' }
    password_confirmation { '1234567' }
  end
end
