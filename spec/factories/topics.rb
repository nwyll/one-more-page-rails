FactoryBot.define do
  factory :topic do
    name Faker::Lorem.sentence
    type "general"
    book_club
  end
end
