require 'rails_helper'

RSpec.describe FinancialOperation, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :amount }
    it { is_expected.to validate_presence_of :ocurred_in }
  end

  describe 'associations' do
    it { should belong_to(:store) }
    it { should belong_to(:card) }
    it { should belong_to(:financial_operation_type) }
    it { should have_one(:holder) }
  end

  let!(:income_operation) { create(:financial_operation, :income) }
  let!(:charge_operation) { create(:financial_operation, :charge) }
  let!(:financial_operation_type) { income_operation.financial_operation_type }

  describe '#by_nature' do
    let(:nature) { financial_operation_type.nature }

    context 'with matches' do
      subject { described_class.by_nature(financial_operation_type.nature) }

      it 'returns filtered nature' do
        expect(subject).to contain_exactly(income_operation)
      end
    end

    context 'without matches' do
      subject { described_class.by_nature(nil) }

      it 'returns filtered nature' do
        expect(subject).to be_empty
      end
    end
  end

  describe '#total_incomes' do
    subject { described_class.total_incomes }

    it 'returns sum of incomes' do
      expect(subject).to eq(income_operation.amount)
    end
  end

  describe '#total_charges' do
    subject { described_class.total_charges }

    it 'returns sum of charges' do
      expect(subject).to eq(charge_operation.amount)
    end
  end

  describe '#total_balance' do
    subject { described_class.total_balance }

    it 'returns difference between incomes and charges' do
      expect(subject).to eq(income_operation.amount - charge_operation.amount)
    end
  end

  describe '#search' do
    context 'filters by store owner' do
      subject { described_class.search(income_operation.store.owner) }

      it 'returns operation' do
        expect(subject).to contain_exactly(income_operation)
      end
    end

    context 'filters by store name' do
      subject { described_class.search(income_operation.store.name) }

      it 'returns operation' do
        expect(subject).to contain_exactly(income_operation)
      end
    end

    context 'filters by holder cpf' do
      subject { described_class.search(income_operation.holder.cpf) }

      it 'returns operation' do
        expect(subject).to contain_exactly(income_operation)
      end
    end
  end
end
