FactoryGirl.define do
  factory :user do
    email 'admin@example.com'
    username 'ionut'
    password 'password'
  end

  factory :user_admin, parent: :user do
    admin true
  end
end
