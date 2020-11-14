class FinancialOperationType < ApplicationRecord
  # Associations
  has_many :financial_operations

  # Enums
  enum nature: Enums::FinancialOperator::VALUES

  # Validations
  validates :description, :nature, presence: true
end
