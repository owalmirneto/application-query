# frozen_string_literal: true

module Interage
  class ApplicationQuery
    PER_PAGE = 50

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

    def find(id)
      all.find_by(id: id)
    end

    def paginate(page = 1)
      all.page(page).per(PER_PAGE)
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
  end
end
