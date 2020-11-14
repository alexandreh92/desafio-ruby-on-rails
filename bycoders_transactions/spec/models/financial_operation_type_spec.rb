require 'rails_helper'

RSpec.describe FinancialOperationType, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :nature }
    it do
      is_expected.to define_enum_for(:nature)
      .with_values(Enums::FinancialOperator::VALUES)
    end
  end

  describe 'associations' do
    it { should have_many(:financial_operations) }
  end
end
