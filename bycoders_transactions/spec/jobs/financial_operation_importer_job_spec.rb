require 'rails_helper'

RSpec.describe FinancialOperationImporterJob, type: :job do
  subject(:job) { described_class }
  let(:file) { File.open("#{Rails.root.join('tmp')}/CNAB.txt") }
  let(:parser) { Parsers::TxtParser }
  let(:splitter) { Splitters::FinancialOperations }
  let(:parsed_file) { parser.new(file: file).parse }
  let(:splitted_data) { splitter.new(string: parsed_file[0]).split }
  let!(:operation_type) do
    create(:financial_operation_type,
           id: splitted_data[:financial_operation_type])
  end

  describe '#perform_later' do
    subject { job.perform_later(splitted_data) }

    it 'enquee job with splitted data' do
      expect { subject }.to enqueue_job
      expect(job).to(have_been_enqueued.with(splitted_data))
    end
  end

  describe '#perform_now' do
    subject { job.perform_now(splitted_data) }

    before { subject }

    it 'creates records with spliited data' do
      expect(Holder.count).to eq(1)
      expect(Store.count).to eq(1)
      expect(FinancialOperation.count).to eq(1)
      expect(Card.count).to eq(1)
    end
  end
end
