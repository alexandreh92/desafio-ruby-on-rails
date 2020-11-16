FactoryBot.define do
  factory :financial_operation_type do
    sequence(:description) { |n| "Description #{n}" }
    nature { %w[income charge].sample }

    trait :income do
      nature { 'income' }
    end

    trait :charge do
      nature { 'charge' }
    end
  end
end
