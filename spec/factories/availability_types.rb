# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :availability_type do
    availability "Full-time"
    kind 'Full Days'
  end
end
