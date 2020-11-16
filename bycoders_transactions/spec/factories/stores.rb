FactoryBot.define do
  factory :store do
    sequence(:name) { |n| "Store #{n}" }
    sequence(:owner) { |n| "Store owner #{n}" }
  end
end
