FactoryGirl.define do
  factory :stage, class: Api::Stage do
    name                'final'
    slug                'final'
    allowed_batteries   1
    modality { create(:modality) }
  end
end
