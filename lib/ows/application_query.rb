# frozen_string_literal: true

module OWS
  class ApplicationQuery
    DEFAULT_PER_PAGE = 50

    delegate :first, :last, :find, :find_by, :find_by!, :pluck, :count, :limit,
             :any?, :exists?, to: :relation

    def initialize
      init_relation
    end

    def init_relation
      raise NotImplementedError, 'subclass did not define #init_relation'
    end

    def all
      includes.relation
    end

    def distinct
      @relation = relation.distinct

      self
    end

    def build(attributes = {})
      all.new(attributes)
    end

    def paginate(page = 1)
      all.page(page).per(current_per_page)
    end

    def search_ilike_for(colums, term)
      return self unless term

      params = { t: "%#{term.to_s.downcase}%" }
      colums = colums.map { |colum| "unaccent(#{colum}) ILIKE unaccent(:t)" }
      @relation = relation.where(colums.join(' OR '), params)

      self
    end

    def between_dates(column, start_date, finish_date = nil)
      start_date = Date.current if start_date.blank?
      finish_date = start_date if finish_date.blank?
      range_date =
        start_date.to_date.beginning_of_day..finish_date.to_date.end_of_day

      @relation = relation.where(column => range_date)

      self
    end

    def by_id(id)
      @relation = relation.where(id: id) if id.present?

      self
    end

    def includes
      self
    end

    def decorate
      @relation = ActiveDecorator::Decorator.instance.decorate(relation)

      self
    end

    protected

    attr_accessor :relation

    def empty_relation
      @relation = relation.none

      self
    end

    def current_per_page
      DEFAULT_PER_PAGE
    end
  end
end
