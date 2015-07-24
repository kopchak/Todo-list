FactoryGirl.define do
  factory :task do
    association (:project)
    title { Faker::Name.title }
    date { '2015-06-25' }
    status { 'false' }
  end
end