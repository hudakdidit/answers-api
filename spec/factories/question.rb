FactoryGirl.define do
  factory :question do |q|
    question { Faker::Beer.yeast }
  end
end
