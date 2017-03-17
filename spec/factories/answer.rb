FactoryGirl.define do
  factory :answer do |a|
    answer { Faker::Beer.style }
    a.association :question
    a.association :day_log
  end
end
