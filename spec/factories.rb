FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    password "1235456"
  end
end
