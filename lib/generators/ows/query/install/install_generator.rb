# frozen_string_literal: true

module Ows
  module Query
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      desc 'Generates a application query.'

      def create_application_query
        copy_file 'application_query.rb', application_query_path
      end

      private

      def application_query_path
        Rails.root.join('app/queries/application_query.rb')
      end
    end
  end
end
