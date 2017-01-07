module AdminScript
  class Bootstrap
    # Inspired by Kaminari
    def load!
      require 'bootstrap-sass'
      require 'jquery-rails'

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
