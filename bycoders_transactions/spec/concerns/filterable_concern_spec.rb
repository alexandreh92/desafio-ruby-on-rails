require 'rails_helper'

RSpec.describe Filterable do
  let!(:financial_operation) { create(:financial_operation) { include Filterable } }
  let(:params) { { search: financial_operation.store.name } }

  describe '#filters' do
    subject { FinancialOperation.filters(params) }

    it 'has a full_name' do
      expect(subject).to contain_exactly(financial_operation)
    end
  end
end
