FactoryBot.define do
  factory :user do
    name "UserName"
    email "user@bloc.io"
    password 'password'
    password_confirmation 'password'
    role "member"
  end
end
