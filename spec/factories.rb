FactoryGirl.define do
  factory :user do
    name "John Doe"
    email "johndoe@test.com"
    password "testPassword1"
    password_confirmation "testPassword1"
  end
end
