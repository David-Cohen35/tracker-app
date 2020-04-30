FactoryBot.define do
  factory :user do
    username { Faker::Books::Dune.character }
    password { "testtest123" }
  end
end
