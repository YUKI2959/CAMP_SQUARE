FactoryBot.define do
  factory :submit do
    id {1}
    title { Faker::Lorem.characters(number: 20) }
    content { Faker::Lorem.characters(number: 100) }

    association :user

    after(:build) do |submit|
      submit.image.attach(io: File.open('public/images/test_submit_image.png'), filename: 'test_submit_image.png')
    end
  end
end
