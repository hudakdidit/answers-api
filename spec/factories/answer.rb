FactoryGirl.define do
  factory :answer do |a|
    answer { Faker::Beer.style }
    a.association :question
  end
end
