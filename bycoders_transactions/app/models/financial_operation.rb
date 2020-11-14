class FinancialOperation < ApplicationRecord
  # Associations
  belongs_to :store
  belongs_to :holder
  belongs_to :financial_operation_type

  # Validations
  validates :amount, :ocurred_in, presence: true
end
