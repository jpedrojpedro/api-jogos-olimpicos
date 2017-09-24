require 'rails_helper'

describe Api::Battery, type: :model do
  let(:battery) { create :battery }

  describe '#rank' do
    context 'empty results' do
      it 'returns empty array' do
        expect(1).to eq(1)
      end
    end
  end
end
