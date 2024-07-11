FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name              {Faker::Name.initials(number: 2)}
    last_name              {Faker::Name.initials(number: 2)}
    phonenumber          { Faker::Number.between(from: 00000000000, to: 99_999_999_999) }
    birth_date              { Faker::Date.between(from: '1900-01-01', to: '2023-12-31') }
    gender                { ["male", "female"].sample}
  end
end