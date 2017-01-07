module AdminScript
  class Bootstrap
    # Inspired by Kaminari
    def load!
      require 'bootstrap-sass'
      require 'sass'
      ::Sass.load_paths << stylesheets_path
    end

    private

    def gem_path
      File.expand_path('../..', File.dirname(__FILE__))
    end

    def vendor_path
      File.join(gem_path, 'vendor')
    end

    def stylesheets_path
      File.join(vendor_path, 'stylesheets')
    end
  end
end
