FactoryGirl.define do
  factory :card do
    original_text { Faker::Text.text }
    translated_text { Faker::Text.text }
  end
end
