FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }
  sequence(:password) { |n| "exampleuser#{n}" }

  factory :user do
    email
    password
    first_name "John"
    last_name "Doe"
    admin false
  end

  factory :admin, class: User do
    email
    password
    first_name "Admin"
    last_name "User"
    admin true
  end
end