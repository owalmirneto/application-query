# frozen_string_literal: true

module Interage
  class ApplicationQuery
    PER_PAGE = 50

    delegate :first, :find_by, :last, :count, :any?, to: :relation

    def all
      includes.relation
    end

    def build(attributes = {})
      all.new(attributes)
    end

    def find(id)
      relation.find_by(id: id)
    end

    def paginate(page = 1)
      all.page(page).per(PER_PAGE)
    end

    def by_id(id)
      @relation = relation.where(id: id) if id.present?

      self
    end

    def search_ilike_for(colums, term)
      return self unless term

      params = { t: "%#{term.to_s.downcase}%" }
      colums = colums.map { |colum| "unaccent(#{colum}) ILIKE unaccent(:t)" }
      @relation = relation.where(colums.join(' OR '), params)

      self
    end

    def between_dates(column, start_date, finish_date = nil)
      start_date = Time.current if start_date.blank?
      finish_date = start_date if finish_date.blank?
      range_date =
        start_date.to_date.beginning_of_day..finish_date.to_date.end_of_day

      @relation = relation.where(column => range_date)

      self
    end

    def includes
      self
    end

    protected

    attr_accessor :relation
  end
end
