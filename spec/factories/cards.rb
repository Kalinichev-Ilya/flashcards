FactoryGirl.define do
  factory :card do
    original_text 'one'
    translated_text 'ainz'
  end

  factory :invalid_card, class: 'Card' do
    original_text nil
    translated_text nil
  end

  factory :new_card, class: 'Card' do
    original_text 'two'
    translated_text 'zvai'
  end
end
