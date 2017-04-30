FactoryGirl.define do
  factory :question do |q|
    question { Faker::Beer.yeast }
    q.association :user
  end
end
