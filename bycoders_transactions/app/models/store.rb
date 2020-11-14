class Store < ApplicationRecord
  # Associations
  has_many :financial_operations

  # Validations
  validates :name, :owner, presence: true
end
