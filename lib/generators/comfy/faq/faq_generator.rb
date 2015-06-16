require 'rails/generators/active_record'

module Comfy
  module Generators
    class FaqGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      include Thor::Actions

      source_root File.expand_path('../../../../..', __FILE__)

      def self.next_migration_number(dirname)
        ActiveRecord::Generators::Base.next_migration_number(dirname)
      end

      def generate_migration
        destination   = File.expand_path('db/migrate/01_create_faq.rb', destination_root)
        migration_dir = File.dirname(destination)
        destination   = self.class.migration_exists?(migration_dir, 'create_faq')

        if destination
          puts "\e[0m\e[31mFound existing create_faq migration. Remove it if you want to regenerate.\e[0m"
        else
          migration_template 'db/migrate/01_create_faq.rb', 'db/migrate/create_faq.rb'
        end
      end

      def generate_initialization
        copy_file 'config/initializers/comfy_faq.rb', 'config/initializers/comfy_faq.rb'
      end

      def generate_routing
        route_string  = "  comfy_route :faq_admin, path: '/admin'\n"
        route_string << "  comfy_route :faq, path: '/faq'\n"
        route route_string[2..-1]
      end

      def generate_views
        directory 'app/views/comfy/faq', 'app/views/comfy/faq'
      end

      def show_readme
        readme 'lib/generators/comfy/faq/README'
      end
    end
  end
end
