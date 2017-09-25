FactoryGirl.define do
  factory :battery, class: Api::Battery do
    number        1
    max_tries     1
    max_athletes  8
    stage { create(:stage) }
  end
end
