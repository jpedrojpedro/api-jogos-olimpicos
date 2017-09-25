require 'rails_helper'

describe Api::Battery, type: :model do
  let(:competition) { create :competition }
  let(:modality) { create :modality, competition: competition }
  let(:stage) { create :stage, modality: modality }
  let(:battery) { create :battery, stage: stage }
  let(:result_bolt) { create :result_bolt, battery: battery }
  let(:result_gatlin) { create :result_gatlin, battery: battery }

  describe '#rank' do
    context 'empty results' do
      before :each do
        allow(battery).to receive(:results).and_return([])
      end

      it 'returns empty array' do
        expect(battery.rank).to eq([])
      end
    end

    context 'valid results' do
      before :each do
        allow(battery)
          .to receive(:results)
          .and_return([result_bolt, result_gatlin])
      end

      it 'returns two results' do
        expect(battery.rank.count).to eq(2)
      end
    end
  end
end
