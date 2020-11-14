module Splitters
  class FinancialOperations
    attr_reader :string

    def initialize(opts = {})
      @string = opts[:string]
    end

    def split
      {
        financial_operation_type: string[0],
        amount: string[9..18].to_f / 100,
        cpf: string[19..29],
        card_number: string[31..42],
        owner: string[48..61].strip,
        store_name: string[62..80].strip,
        date: string[1..8],
        hour: string[42..47]
      }
    end
  end
end
