FactoryBot.define do
  factory :event do
    title { "MyString" }
    description { "MyText" }
    start_date { "2026-02-01 12:45:41" }
    organiser_name { "MyString" }
    target_dapartment { "MyString" }
    user { nil }
  end
end
