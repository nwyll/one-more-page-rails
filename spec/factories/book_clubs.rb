FactoryBot.define do
  factory :book_club do
    title Faker::Lorem.sentence
    author Faker::Name.name
    description Faker::Lorem.paragraph
    start_date Date.today.beginning_of_month
    end_date Date.today.end_of_month
  end
end
