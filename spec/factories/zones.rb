FactoryGirl.define do
  factory :zone do
    sequence(:name) { |n| "zone-#{n}" }
  end
end