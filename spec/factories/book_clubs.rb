FactoryBot.define do
  factory :book_club do
    title Faker::Lorem.sentence
    author Faker::Name.name
    description Faker::Lorem.paragraph
    startdate "2018-01-01"
    enddate "2018-01-31"
  end
end
