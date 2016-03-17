FactoryGirl.define do
  factory :user do
  	name 'Rakesh'
    sequence(:email) { |n| "email#{n}@gmail.com"}
    password 'Admin@123'
  end
end
