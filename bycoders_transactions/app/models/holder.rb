class Holder < ApplicationRecord
  # Associations
  has_many :cards
  has_many :financial_operations, through: :cards

  # Validations
  validates :cpf, presence: true
  validates_uniqueness_of :cpf
end
