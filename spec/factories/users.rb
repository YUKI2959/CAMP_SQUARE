FactoryBot.define do
  factory :user do
    id {1}
    nickname {Faker::Name.last_name}
    profile {Faker::Name.last_name }
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}

    after(:build) do |user|
      user.image.attach(io: File.open('public/images/test_user_image.png'), filename: 'test_user_image.png')
    end
  end
end