# frozen_string_literal: true

module Interage
  module Query
    module Generators
      class CreateGenerator < Rails::Generators::NamedBase
        source_root File.expand_path('templates', __dir__)

        desc 'Generates a query.'

        def initialize(args, *_options)
          super

          @query_name = args[0].camelize
          @model_name = args[1].camelize
        end

        def create_query
          create_file Rails.root.join("app/queries/#{file_name}_query.rb"),
                      sample_file.gsub('{{QUERY_NAME}}', query_name)
                                 .gsub('{{MODEL_NAME}}', model_name)
        end

        private

        attr_reader :query_name, :model_name

        def sample_file
          File.read(File.expand_path('templates/sample_query.rb', __dir__))
        end
      end
    end
  end
end
