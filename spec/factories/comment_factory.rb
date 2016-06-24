FactoryGirl.define do

  factory :comment do
    association :product
    user @user
    rating 3
    body "Great book"
  end

end