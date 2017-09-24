require 'rails_helper'

describe Api::Battery, type: :model do
  let(:battery) { create :battery }

  describe '#rank' do
    context 'empty results' do
      before :each do
        allow(battery).to receive(:results).and_return([])
      end

      it 'returns empty array' do
        expect(battery.rank).to eq([])
      end
    end
  end
end
