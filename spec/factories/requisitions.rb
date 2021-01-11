FactoryBot.define do
  factory :requisition do
    title { "MyString" }
    department { "MyString" }
    full_time { false }
    preferred_start_date { "2021-01-10" }
    job_description { "MyText" }
    user { nil }
  end
end
