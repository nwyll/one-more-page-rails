FactoryBot.define do
  factory :book_club do
    title Faker::Lorem.sentence
    author Faker::Name.name
    description Faker::Lorem.paragraph
    start_date Date.today.beginning_of_month
    end_date Date.today.end_of_month
    cover File.open(File.join(Rails.root,'app/assets/images/cover_art/generic_cover.jpg'))
  end
end
