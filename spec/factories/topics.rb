FactoryBot.define do
  factory :topic do
    name Faker::Lorem.sentence
    topic_type "general"
    book_club
  end
end
