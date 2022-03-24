# frozen_string_literal: true

require 'ows/queries/version'
require 'active_support/core_ext/module'

require 'denki'

module OWS
  module Queries
    class Error < StandardError
    end
  end

  autoload :ApplicationQuery, 'ows/application_query'
end
