class FinancialOperationImporterJob < ApplicationJob
  queue_as :default

  def perform(operation)
    store = Store.find_or_create_by(
      owner: operation[:owner],
      name: operation[:store_name]
    )

    holder = Holder.where(cpf: operation[:cpf]).first_or_create!

    card = Card.find_or_create_by(holder: holder, number: operation[:card_number])

    operation_type = FinancialOperationType.find(
      operation[:financial_operation_type]
    )

    FinancialOperation.create(
      store: store,
      card: card,
      financial_operation_type: operation_type,
      amount: operation[:amount],
      ocurred_in: ocurred_in(operation)
    )
  end

  private

    def ocurred_in(operation)
      Time.zone = 'Brasilia'
      Time.zone.parse("#{operation[:date]} #{operation[:hour]}")
    end
end
