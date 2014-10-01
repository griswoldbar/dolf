FactoryGirl.define do
  factory :muscle do
    sequence(:name) { |n| "muscle-#{n}" }
    zone
  end
end