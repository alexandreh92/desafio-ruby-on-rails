require 'rails_helper'

RSpec.describe Parsers::TxtParser do
  let(:file) { File.open("#{Rails.root.join('tmp')}/CNAB.txt") }
  subject(:lib) { described_class.new(file: file) }

  describe '#parse' do
    subject { lib.parse }

    it 'returns array of strings' do
      expect(subject.class).to eq(Array)
      expect(subject.first.class).to eq(String)
      expect(subject).to_not be_nil
    end
  end
end
