FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    uuid { SecureRandom.uuid }
    password 'asdfjkl123'
    password_confirmation 'asdfjkl123'
    sequence(:email) { |n| "user_#{n}@example.com" }

    trait :admin do
      roles [:admin]
      first_name 'Admin'
      last_name 'User'
      email 'admin@example.com'
    end
  end
end
