class Card < ApplicationRecord
  # Associations
  belongs_to :holder

  # Validations
  validates :number, presence: true
end
