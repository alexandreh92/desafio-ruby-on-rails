# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
financial_operation_types = [
  { id: 1, description: 'Débito', nature: 'income' },
  { id: 2, description: 'Boleto', nature: 'charge' },
  { id: 3, description: 'Financiamento', nature: 'charge' },
  { id: 4, description: 'Crédito', nature: 'income' },
  { id: 5, description: 'Recebimento Empréstimo', nature: 'income' },
  { id: 6, description: 'Vendas', nature: 'income' },
  { id: 7, description: 'Recebimento TED', nature: 'income' },
  { id: 8, description: 'Recebimento DOC', nature: 'income' },
  { id: 9, description: 'Aluguel', nature: 'charge' }
]

financial_operation_types.each do |financial_operation_type|
  FinancialOperationType.find_or_create_by(financial_operation_type)
end
