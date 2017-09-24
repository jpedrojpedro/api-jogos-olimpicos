FactoryGirl.define do
  factory :stage, class: Api::Stage do
    name                'final'
    slug                'final'
    allowed_batteries   1
    modality { |_stage| create(:modality) }
  end
end
