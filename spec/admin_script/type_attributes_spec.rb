RSpec.describe AdminScript::TypeAttributes do
  let(:klass) do
    Class.new do
      include(AdminScript::TypeAttributes)

      %i(
        big_integer
        binary
        boolean
        date
        datetime
        decimal
        float
        integer
        string
        text
        time
      ).each do |type|
        define_type_attribute_accessor(type, type)
      end
    end
  end

  let(:instance) { klass.new }

  {
    big_integer: ['1', 1],
    binary: ['1', '1'],
    boolean: ['1', true],
    date: ['2016-01-01', Date.parse('2016-01-01')],
    datetime: ['2016-01-01', DateTime.parse('2016-01-01')],
    decimal: ['1', 1],
    float: ['1', 1.0],
    integer: ['1', 1],
    string: ['1', '1'],
    text: ['1', '1'],
    time: ['2000/01/01 00:00:00', Time.parse('2000-01-01 00:00:00 UTC')],
  }.each do |key, (from, to)|
    context "type of #{key}" do
      it "casts value" do
        expect(instance.public_send(key)).to be_nil
        instance.public_send("#{key}=", from)
        expect(instance.public_send(key)).to eq(to)
      end
    end
  end
end
