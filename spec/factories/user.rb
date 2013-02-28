require 'factory_girl'
FactoryGirl.define do
  factory :admin, :class=>User do
    email "admin@test.com"
    password "password"
    password_confirmation {"password"}
    is_admin true
  end
  factory :user do
    email "user@test.com"
    password "password"
    password_confirmation {"password"}
  end
end
