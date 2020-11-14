class Holder < ApplicationRecord
  # Associations
  has_many :cards
  has_many :financial_operations

  # Validations
  validates :cpf, presence: true, uniqueness: true
end
