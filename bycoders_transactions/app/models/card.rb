class Card < ApplicationRecord
  # Associations
  belongs_to :holder
  has_many :financial_operations

  # Validations
  validates :number, presence: true
end
