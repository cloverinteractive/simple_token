FactoryGirl.define do
  sequence :name do |n|
    "dummy#{ n }"
  end

  factory :post do
    title { generate :name }
  end

  factory :user do
    username { generate :name }
  end
end
