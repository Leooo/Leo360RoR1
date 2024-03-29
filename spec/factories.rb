FactoryGirl.define do

  factory :user do
    sequence(:name) {|n| "User #{n}"}
    sequence(:email) {|n| "user_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
    factory :admin do
      admin true
    end
  end

  factory :profile do
    sequence(:name) {|n| "Profile #{n}"}
  end

  factory :feedback_filled do
    profile
    user
  end
  
end
