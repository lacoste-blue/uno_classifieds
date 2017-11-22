FactoryBot.define do
  factory :user do
    name 'John Doe'
    email { Faker::Internet.user_name + '@uno.edu'}
    password 'password'
    password_confirmation 'password'
    admin false
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, :class => User do
    name 'Admin User'
    email { Faker::Internet.user_name + '@uno.edu'}
    password 'password'
    password_confirmation 'password'
    admin true
  end
end

