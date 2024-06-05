FactoryBot.define do
  factory :link do
    title { Faker::Company.name }
    url { Faker::Internet.url }
  end
end