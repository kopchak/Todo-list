FactoryGirl.define do
  factory :project do
    association (:user)
    title { Faker::Name.title }
  end
end