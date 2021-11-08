# frozen_string_literal: true

class {{QUERY_NAME}}Query < ApplicationQuery
  def initialize
    @relation = {{MODEL_NAME}}.order(created_at: :desc)
  end
end
