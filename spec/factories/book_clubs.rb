FactoryBot.define do
  factory :book_club do
    title Faker::Lorem.sentence
    author Faker::Name.name
    description Faker::Lorem.paragraph
    start_date "2018-01-01"
    end_date "2018-01-31"
  end
end
