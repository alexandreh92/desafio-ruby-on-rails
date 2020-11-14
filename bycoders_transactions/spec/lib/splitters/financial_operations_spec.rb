require 'rails_helper'

RSpec.describe Splitters::FinancialOperations do
  subject(:lib) { described_class.new(string: string) }

  let(:string) do
    '3201903010000014200096206760174753****3153153453JOÃO MACEDO   BAR DO JOÃO     '
  end

  describe '#split' do
    subject { lib.split }

    it 'returns hash' do
      expect(subject[:financial_operation_type]).to eq('3')
      expect(subject[:amount]).to eq(142.0)
      expect(subject[:cpf]).to eq('09620676017')
      expect(subject[:card_number]).to eq('753****31531')
      expect(subject[:owner]).to eq('JOÃO MACEDO')
      expect(subject[:store_name]).to eq('BAR DO JOÃO')
      expect(subject[:date]).to eq('20190301')
      expect(subject[:hour]).to eq('153453')
    end
  end
end
