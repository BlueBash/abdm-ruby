require 'rails/generators'

module Abdm
  module Generators
    class InitializerGenerator < Rails::Generators::Base
      desc "Creates an initializer for ABDM configuration"
      source_root File.expand_path('templates', __dir__)

      def copy_initializer_file
        template "initializer.rb", "config/initializers/abdm.rb"
      end
    end
  end
end
