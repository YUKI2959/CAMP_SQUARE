FactoryBot.define do
  factory :comment do
    coment {Faker::Lorem.sentence}
    association :user
    association :submit
  end
end
