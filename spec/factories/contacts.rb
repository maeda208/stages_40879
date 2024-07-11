FactoryBot.define do
  factory :contact do
    email                 {Faker::Internet.email}
    first_name              {Faker::Name.initials(number: 2)}
    last_name              {Faker::Name.initials(number: 2)}
    association :user 
  end
end
