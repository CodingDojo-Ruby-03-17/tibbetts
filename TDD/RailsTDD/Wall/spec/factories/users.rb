FactoryGirl.define do
  factory :user do
    first_name "Kyle"
    last_name "Tibbetts"
    username "kybit"
    password "password"
    email "kt@mail.com"
  end

  trait :no_firstname do
    first_name ""
  end

  trait :no_username do
    username ""
  end

end
