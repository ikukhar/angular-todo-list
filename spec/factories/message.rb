FactoryGirl.define do
  factory :message do
    text Faker::Lorem.sentence
    association :task, factory: :task
  end
end
