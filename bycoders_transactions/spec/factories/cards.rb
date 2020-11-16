FactoryBot.define do
  factory :card do
    sequence(:number) { |n| n }

    holder
  end
end
