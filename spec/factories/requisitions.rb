FactoryBot.define do
  factory :requisition do
    title { Faker::Company.profession }
    department { Faker::Company.industry }
    full_time { Faker::Boolean.boolean }
    preferred_start_date { Faker::Date.between(from: 2.weeks.from_now, to: 1.year.from_now) }
    job_description { Faker::Lorem.paragraphs(number: 3, supplemental: true).join('/n') }
    user factory: :hiring_manager
  end
end
