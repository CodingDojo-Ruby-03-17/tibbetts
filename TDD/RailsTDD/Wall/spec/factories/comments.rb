FactoryGirl.define do
  factory :comment do
    comment "This is a test comment"
    message nil 
    user nil
  end

  trait :no_comment do
    comment ""
  end
end
