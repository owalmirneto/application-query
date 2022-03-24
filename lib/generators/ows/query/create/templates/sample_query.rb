# frozen_string_literal: true

class {{QUERY_NAME}}Query < ApplicationQuery
  def init_relation
    @relation = {{MODEL_NAME}}.all
  end
end
