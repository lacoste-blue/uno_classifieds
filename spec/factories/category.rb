FactoryBot.define do
  sequence :name do |n|
    "Test cat #{n}"
  end

  factory :category do
    name
  end
end

