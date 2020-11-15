FactoryBot.define do
  factory :financial_operation_type do
    sequence(:description) { |n| "Description #{n}" }
    nature { [0, 1].sample }
  end
end
