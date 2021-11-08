# frozen_string_literal: true

module OWS
  RSpec.describe DummyQuery do
    it { is_expected.to respond_to(:first) }
    it { is_expected.to respond_to(:last) }
    it { is_expected.to respond_to(:find) }
    it { is_expected.to respond_to(:find_by) }
    it { is_expected.to respond_to(:find_by!) }
    it { is_expected.to respond_to(:pluck) }
    it { is_expected.to respond_to(:count) }
    it { is_expected.to respond_to(:limit) }
    it { is_expected.to respond_to(:any?) }
    it { is_expected.to respond_to(:exists?) }

    it { is_expected.to respond_to(:all) }
    it { is_expected.to respond_to(:build) }
    it { is_expected.to respond_to(:paginate) }
    it { is_expected.to respond_to(:by_id) }
    it { is_expected.to respond_to(:search_ilike_for) }
    it { is_expected.to respond_to(:between_dates) }
    it { is_expected.to respond_to(:includes) }
  end
end
