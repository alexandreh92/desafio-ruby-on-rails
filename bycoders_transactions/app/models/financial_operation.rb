class FinancialOperation < ApplicationRecord
  # Associations
  belongs_to :store
  belongs_to :card
  belongs_to :financial_operation_type

  has_one :holder, through: :card

  # Validations
  validates :amount, :ocurred_in, presence: true
end
