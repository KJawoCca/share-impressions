FactoryBot.define do
  factory :review do
    title {Faker::Lorem.word}
    text {Faker::Lorem.sentence}
    opus_title {Faker::Lorem.word}
    author_name {Faker::Name.name}
    association :user
  end
end
