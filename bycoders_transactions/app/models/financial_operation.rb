class FinancialOperation < ApplicationRecord
  include Filterable

  # Associations
  belongs_to :store
  belongs_to :card
  belongs_to :financial_operation_type
  has_one :holder, through: :card

  # Validations
  validates :amount, :ocurred_in, presence: true

  # Scopes

  scope :search, lambda { |search|
    search = "%#{search}%"

    owner_matches = Store.arel_table[:owner].matches(search)
    store_matches = Store.arel_table[:name].matches(search)
    cpf_matches = Holder.arel_table[:cpf].matches(search)
    card_number_matches = Card.arel_table[:number].matches(search)

    joins(:store).where(owner_matches.or(store_matches).or(cpf_matches).or(card_number_matches))
  }

  scope :by_nature, lambda { |nature|
    joins(:financial_operation_type).where(
      financial_operation_types: {
        nature: nature
      }
    )
  }

  scope :total_incomes, lambda {
    by_nature('income').sum(:amount)
  }

  scope :total_charges, lambda {
    by_nature('charge').sum(:amount)
  }

  scope :total_balance, lambda {
    total_incomes - total_charges
  }
end
