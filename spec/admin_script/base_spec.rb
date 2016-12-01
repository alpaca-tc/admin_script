require 'spec_helper'

RSpec.describe AdminScript::Base do
  describe '#subclasses' do
    subject { described_class.subclasses }
    it { is_expected.to be_a(Array) }
  end

  describe '.id' do
    it 'returns identification' do
      ids = described_class.subclasses.map(&:id)
      expect(ids.length).to eq(ids.uniq.length)
    end
  end
end
