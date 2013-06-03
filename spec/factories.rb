# FactoryGirl.define do
#   factory :user do
#     name     "Example User"
#     email    "example@gmail.com"
#     password "foobar"
#     password_confirmation "foobar"
#   end
# end

FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@gmail.com"}   
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
end

