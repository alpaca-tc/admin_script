require 'spec_helper'

RSpec.describe AdminScript::Base do
  before do
    # Clear descendants from ActiveSupport::DescendantsTracker
    ActiveSupport::DescendantsTracker.direct_descendants(described_class).clear
  end

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

  describe 'inherited class' do
    let(:klass) do
      Class.new(described_class) do
        # FIXME: Stub class name
        def self.model_name
          ActiveModel::Name.new(self, nil, 'klass')
        end

        self.description = 'Hello World'
        self.type_attributes = {
          hello: :string,
          world: :integer
        }
      end
    end

    let(:instance) { klass.new }

    describe '.description' do
      subject { instance.description }

      it 'returns description' do
        is_expected.to eq('Hello World')
      end
    end

    describe '.type_attributes' do
      it 'defines type caster' do
        instance.hello = 1
        expect(instance.hello).to eq('1')

        instance.world = 'to integer'
        expect(instance.world).to eq(0)
      end
    end

    describe '#perform' do
      subject do
        -> { instance.perform }
      end

      it { is_expected.to raise_error(NotImplementedError) }
    end
  end
end
