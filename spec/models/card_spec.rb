require 'rails_helper'
require 'card.rb'

RSpec.describe Card, type: :model do
  it 'validates presence of card text' do
    card = Card.new(original_text: 'one', translated_text: 'ainz')
    expect(card).to be_valid
  end

  it 'before creating a review date check' do
    card = Card.new(original_text: 'one', translated_text: 'ainz')
    card.save
    card.review_date.round.should eq(3.days.since.round)
  end

  it 'should remove extra space when validated' do
    card = Card.new(original_text: ' one ', translated_text: ' ainz ')
    card.valid?
    card.original_text.should eq('one')
    card.translated_text.should eq('ainz')
  end

  it 'original text and translated text cannot be equals in validation' do
    card = Card.new(original_text: 'one', translated_text: 'ainz')
    card.valid?.should eq(true)
    card = Card.new(original_text: 'one', translated_text: 'one')
    card.valid?.should eq(false)
  end
end
