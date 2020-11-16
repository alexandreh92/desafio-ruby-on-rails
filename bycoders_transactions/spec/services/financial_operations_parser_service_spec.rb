require 'rails_helper'

RSpec.describe FinancialOperationsParserService, type: :service do
  let(:file) do
    fixture_file_upload(File.open("#{Rails.root.join('tmp')}/CNAB.txt"), 'text/xml')
  end
  let(:parser) { Parsers::TxtParser }
  let(:splitter) { Splitters::FinancialOperations }
  let(:parsed_file) { parser.new(file: file).parse }
  let(:splited_data) { splitter.new(string: parsed_file[0]).split }
  subject(:service) do
    described_class.new(
      file: file,
      parser: parser,
      splitter: splitter
    )
  end

  describe '#call' do
    context 'with success' do
      subject { service.call }

      it 'triggers Job with splitted values' do
        expect { subject }.to have_enqueued_job(
          FinancialOperationImporterJob
        ).exactly(21).times
        expect(FinancialOperationImporterJob).to(
          have_been_enqueued.at_least(:once).with(splited_data)
        )
        expect(subject).to eq(true)
      end
    end

    context 'with failure' do
      let(:parser) { nil }
      subject { service.call }

      it 'rescue error with FalseClass' do
        expect(subject).to eq(false)
      end
    end
  end
end
