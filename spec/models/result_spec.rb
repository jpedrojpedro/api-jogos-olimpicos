require 'rails_helper'

describe Api::Result, type: :model do
  let(:competition) { create :competition }
  let(:modality) { create :modality, competition: competition }
  let(:stage) { create :stage, modality: modality }
  let(:battery) { create :battery, stage: stage }

  describe '#validate_attempts' do
    context 'single attempt allowed' do
      before :each do
        @result = Api::Result.new do |r|
          r.athlete = 'João Pedro'
          r.country = 'BRA'
          r.value   = 12.630
          r.battery = battery
        end
      end

      it 'validates and persist object' do
        @result.save
        expect(@result.persisted?).to eq(true)
      end

      it 'validates and persist object' do
        result_1 = @result.dup
        result_2 = @result.dup
        result_1.save
        result_2.save
        expect(result_1.persisted?).to eq(true)
        expect(result_2.persisted?).to eq(false)
      end
    end
  end
end
