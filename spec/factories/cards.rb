FactoryGirl.define do
  factory :card do
    id '1'
    original_text 'wie'
    translated_text 'as'
    review_date '2017-05-20 13:59:45'
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
