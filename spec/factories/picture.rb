FactoryBot.define do
  factory :picture do
    image File.new(Rails.root.join('app', 'assets', 'images', 'uno_logo.png'))
    association :listing, :factory => :listing
  end

  factory :image, :class => Picture do
    image File.new(Rails.root.join('app', 'assets', 'images', 'uno_logo.png'))
  end
end

