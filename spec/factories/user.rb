FactoryGirl.define do
  factory :user do
    email{ Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
    provider 'email'
    confirmed_at Time.now
  end
end
