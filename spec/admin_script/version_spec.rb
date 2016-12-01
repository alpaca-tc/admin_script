RSpec.describe AdminScript do
  describe 'VERSION' do
    subject { described_class::VERSION }

    it 'returns current version' do
      is_expected.to match(/^\d+\.\d+\.\d+$/)
    end
  end
end
