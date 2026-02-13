FactoryBot.define do
  factory :user do
    fullname { 'テスト太郎' }
    sequence :email do |n|
      "test#{n}@example.com"
    end
    password { '11111111' }
    password_confirmation { '11111111' }
  end
end