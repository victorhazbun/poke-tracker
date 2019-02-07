FactoryBot.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  sequence :name do |n|
    "name #{n}"
  end

  factory :user do
    name
    email
    password { 'is-sekret' }
    password_confirmation { 'is-sekret' }
  end
end
