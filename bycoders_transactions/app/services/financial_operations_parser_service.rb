class FinancialOperationsParserService
  attr_reader :file, :parser, :splitter

  def initialize(opts = {})
    @file = opts[:file]
    @parser = opts[:parser]
    @splitter = opts[:splitter]
  end

  def call
    parser.new(file: file.tempfile).parse.each do |financial_operation|
      FinancialOperationImporterJob.perform_later(
        splitter.new(string: financial_operation).split
      )
    end
    true
  rescue StandardError
    # notify log/debug API
    false
  end
end
