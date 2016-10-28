FactoryGirl.define do
  factory :user do
    name "John Doe"
    email "johndoe@test.com"
    password "testPassword1"
    password_confirmation "testPassword1"
  end
  
  factory :dare do
    title "Dare test"
    description "This is a test"
  end
  
  factory :invalid_dare, parent: :dare do
    title ""
    description ""  
  end
end
