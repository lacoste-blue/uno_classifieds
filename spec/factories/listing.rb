FactoryBot.define do
  sequence :title do |n|
    "title #{n}"
  end
end

FactoryBot.define do
  factory :listing do
    title
    association :category, :factory => :category
    association :user, :factory => :user
    location 'location'
    description 'MyText'
    all_tags 'apple, dog'
    price 2.5
  end
end



