FactoryBot.define do
  factory :stage do
    reward                { Faker::Number.between(from: 00000000000, to: 99_999_999_999) }
    title                 { Faker::Name.initials }
    month_id              { Faker::Number.between(from: 1, to: 12) }
    day_id                { Faker::Number.between(from: 1, to: 31) }
    show_hour_id          { Faker::Number.between(from: 1, to: 24) }
    end_hour_id           { Faker::Number.between(from: 1, to: 24) }
    theater                { Faker::Name.initials }
    address                { Faker::Name.initials }
    conditions             { Faker::Name.initials }
    association :user 
    
  end
end
