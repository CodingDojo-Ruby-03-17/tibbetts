FactoryGirl.define do
  factory :message do
    message "This is a test message"
    user nil
  end

  trait :no_message do
    message ""
  end

end
