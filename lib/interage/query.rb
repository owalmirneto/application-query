# frozen_string_literal: true

require 'interage/query/version'
require 'active_support/core_ext/module'

require 'kaminari'

module Interage
  module Query
    class Error < StandardError
    end
  end

  autoload :ApplicationQuery, 'interage/application_query'
end
