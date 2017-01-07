require 'sass'

module AdminScript
  class Bootstrap
    def load!
      require 'sass'
      ::Sass.load_paths << stylesheets_path
    end

    private

    def gem_path
      File.expand_path('../..', File.dirname(__FILE__))
    end

    def stylesheets_path
      File.join(gem_path, 'vendor', 'stylesheets')
    end
  end
end
