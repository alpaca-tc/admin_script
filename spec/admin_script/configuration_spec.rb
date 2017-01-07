RSpec.describe AdminScript::Configuration do
  describe '.define_configuration' do
    let(:klass) do
      Class.new(described_class) do
        define_configuration(:key, default: 'default_value')
      end
    end

    it 'defines configuration' do
      configuration = klass.new
      expect(configuration.key).to eq('default_value')

      configuration.key = 'custom value'
      expect(configuration.key).to eq('custom value')
    end
  end
end
