FactoryBot.define do
  factory :post do
    body Faker::Lorem.paragraph
    topic
    user
  end
end
