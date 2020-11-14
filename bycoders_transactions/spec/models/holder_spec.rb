require 'rails_helper'

RSpec.describe Holder, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :cpf }
    it { is_expected.to validate_uniqueness_of :cpf }
  end

  describe 'associations' do
    it { should have_many(:cards) }
    it { should have_many(:financial_operations) }
  end
end
