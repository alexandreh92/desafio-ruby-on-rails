require 'rails_helper'

RSpec.describe Card, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :number }
  end

  describe 'associations' do
    it { should belong_to(:holder) }
  end
end
