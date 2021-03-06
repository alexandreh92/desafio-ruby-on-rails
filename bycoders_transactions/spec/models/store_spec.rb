require 'rails_helper'

RSpec.describe Store, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :owner }
  end

  describe 'associations' do
    it { should have_many(:financial_operations) }
  end
end
