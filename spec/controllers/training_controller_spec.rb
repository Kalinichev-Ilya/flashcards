require 'rails_helper'
require 'training_controller.rb'
require 'check_card.rb'

RSpec.describe CardsController, type: :controller do
  let(:card) {create(:card)}

  describe '.call' do
    subject(:context) {CheckCard.call(user_input: card.original_text, card_id: card.id)}

    context 'when answer is valid' do
      it 'succeeds' do
        expect(context).to be_a_success
      end
    end
    context 'when given invalid params' do
      subject(:context) {CheckCard.call(user_input: card.original_text, card_id: card.id)}

      it 'fails' do
        expect(context).to_not be_a_failure
      end
    end
  end
end
