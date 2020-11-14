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
end
