FactoryGirl.define do
  factory :user do |a|
    pword = Faker::Food.ingredient
    email { Faker::Internet.email }
    password { pword }
    password_confirmation { pword }
  end
end
