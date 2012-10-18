FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :post do
    sequence(:name)  { |n| "Post #{n}" }
    image_url "http://google.com"
    link_url "http://google.com"
  end

  factory :comment do
    content "Lorem ipsum"
    user
  end
end