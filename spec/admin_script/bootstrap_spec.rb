require 'sass'

RSpec.describe AdminScript::Bootstrap do
  describe '#load!' do
    subject do
      -> { described_class.new.load! }
    end

    it 'append stylesheets_path to Sass.load_paths' do
      is_expected.to change {
        ::Sass.load_paths.any? { |path| %r{admin_script/vendor/stylesheets} =~ path }
      }.from(false).to(true)
    end
  end
end
