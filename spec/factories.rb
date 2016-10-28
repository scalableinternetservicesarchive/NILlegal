FactoryGirl.define do
  factory :dare_submission do
    content "MyText"
    user nil
    dare nil
  end
  factory :user do
    name "John Doe"
    email "johndoe@test.com"
    password "testPassword1"
    password_confirmation "testPassword1"
  end

  factory :another_user, parent: :user do
    name "Jane Doe"
    email "janedoe@test.com"
    password "testPassword2"
    password_confirmation "testPassword2"
  end
  
  factory :user2, parent: :user do
    name "Jo Bob"
    email "jobob@test.com"
    password "testPassword2"
    password_confirmation "testPassword2"
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
