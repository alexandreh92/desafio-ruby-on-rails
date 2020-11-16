FactoryBot.define do
  factory :holder do
    sequence(:cpf) { |n| n }
  end
end
