require 'rails_helper'

RSpec.describe Parsers::Base do
  let(:file) { File.open("#{Rails.root.join('tmp')}/CNAB.txt") }
  subject(:lib) { described_class.new(file: file) }

  describe '#read' do
    subject { lib.read }

    it 'reads file and returns concatenated string' do
      expect(subject.class).to eq(String)
      expect(subject).to_not be_nil
    end
  end

  describe '#readlines' do
    subject { lib.readlines }

    it 'returns array of strings' do
      expect(subject.class).to eq(Array)
      expect(subject.first.class).to eq(String)
      expect(subject).to_not be_nil
    end
  end
end
