FactoryGirl.define do
  factory :user do
    name     "Some Dude"
    email    "sdude@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end