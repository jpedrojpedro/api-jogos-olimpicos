FactoryGirl.define do
  factory :result, class: Api::Result do
    athlete   'Usain Bolt'
    country   'JAM'
    value     9.630
    battery { |_result| create(:battery) }
  end
end
