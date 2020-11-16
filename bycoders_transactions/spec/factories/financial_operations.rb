FactoryBot.define do
  factory :financial_operation do
    ocurred_in { Date.today }
    amount { 10.0 }

    card
    store
    financial_operation_type

    trait :income do
      financial_operation_type { create(:financial_operation_type, :income) }
    end

    trait :charge do
      financial_operation_type { create(:financial_operation_type, :charge) }
    end
  end
end
