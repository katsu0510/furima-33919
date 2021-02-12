FactoryBot.define do
  factory :item do
    name              {Faker::Name.name}
    description          {Faker::Lorem.sentence}
    category_id              {"0"}
    state_id              {"0"}
    ship_cost_id                 {"0"}
    prefecture_id              {"0"}
    ship_day_id              {"0"}
    price              {"0"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
