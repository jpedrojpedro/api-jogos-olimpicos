FactoryGirl.define do
  factory :result_bolt, class: Api::Result do
    athlete   'Usain Bolt'
    country   'JAM'
    value     9.630
    battery { create(:battery) }
  end

  factory :result_gatlin, class: Api::Result do
    athlete   'Justin Gatlin'
    country   'EUA'
    value     9.820
    battery { create(:battery) }
  end
end
