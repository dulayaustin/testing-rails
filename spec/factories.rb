FactoryBot.define do
  factory :link do
    title { Faker::Company.name }
    url { Faker::Internet.url }

    trait :invalid do
      title { nil }
    end
  end
end