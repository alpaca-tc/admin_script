require 'spec_helper'

RSpec.describe AdminScript::Base do
  before do
    # Clear descendants from ActiveSupport::DescendantsTracker
    ActiveSupport::DescendantsTracker.direct_descendants(described_class).clear
  end

  let!(:inherited) do
    class AdminScript::Inherited < AdminScript::Base; end
    AdminScript::Inherited
  end

  after do
    AdminScript.send(:remove_const, :Inherited) if defined?(AdminScript::Inherited)
  end

  describe 'ClassMethods' do
    describe '.inherited' do
      subject do
        -> { Class.new(described_class) }
      end

      it 'defines class attributes' do
        instance = subject.call

        expect {
          instance.description
          instance.type_attributes
        }.to_not raise_error
      end

      context 'inherit reserved class name' do
        subject do
          -> {
            class AdminScript::Engine < described_class; end
          }
        end

        it { is_expected.to raise_error(ArgumentError) }
      end
    end

    describe '.type_attribute' do
      it 'defines type castor' do
        inherited.type_attribute(:key, :integer)
        expect(inherited.new.key).to be_nil
        expect(inherited.new(key: '1').key).to eq(1)
      end
    end

    describe '.to_param' do
      subject { inherited.to_param }

      it 'returns element name' do
        is_expected.to eq('inherited')
      end
    end

    describe '.find_class' do
      subject { described_class.find_class('inherited') }

      it 'finds class by param' do
        is_expected.to eq(inherited)
      end
    end

    describe '.script' do
      subject { inherited.script }

      it 'returns method source of #perform' do
        is_expected.to match(/def perform/)
      end
    end

    describe '.subclasses' do
      subject { described_class.subclasses }
      it { is_expected.to be_a(Array).and be_include(inherited) }
    end
  end

  describe 'InstanceMethods' do
    let(:instance) { inherited.new }

    describe '#to_param' do
      subject { instance.to_param }
      it { is_expected.to eq('inherited') }
    end

    describe '#perform' do
      subject do
        -> { instance.perform }
      end

      it { is_expected.to raise_error(NotImplementedError) }
    end

    describe '#success_message' do
      subject { instance.success_message }
      it { is_expected.to be_nil }
    end

    describe '#failure_message' do
      subject { instance.failure_message }
      it { is_expected.to be_nil }
    end
  end
end
