FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    password "1235456"
  end
end

FactoryBot.define do
  factory :movie do
    name {Faker::Artist.name}
    genre "Action"
    image_url "https://kbob.github.io/images/sample-1.jpg"
    price "199.00"
    duration "60"
  end
end

FactoryBot.define do
  factory :line_item do
    movie_id {FactoryBot.create(:movie)}
    cart_id {FactoryBot.create(:cart)}
    quantity 1
  end
end

FactoryBot.define do
  factory :cart do
  end
end
