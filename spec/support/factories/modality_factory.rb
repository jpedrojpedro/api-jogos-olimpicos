FactoryGirl.define do
  factory :modality, class: Api::Modality do
    name                '100m Rasos'
    slug                '100m-rasos'
    measurement_unity   'segundos'
    ended_at            nil
    competition { create(:competition) }
  end
end
