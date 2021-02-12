FactoryBot.define do
  factory :profile do
    client { nil }
    first_name { "MyString" }
    last_name { "MyString" }
    birth_date { "2021-01-24" }
    about_me { "MyText" }
    atw { false }
  end
end
