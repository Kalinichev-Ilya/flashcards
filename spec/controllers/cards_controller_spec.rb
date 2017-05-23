require 'rails_helper'
require 'cards_controller.rb'

RSpec.describe CardsController, type: :controller do
  let(:card) {create(:card)}

  describe 'GET #index' do
    let(:cards) {create_list(:card, 2)}

    before {get :index}

    it 'populates an array of all cards' do
      expect(assigns(:cards)).to match_array(cards)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before {get :show, params: {id: card}}

    it 'assigns the requested card to @card' do
      expect(assigns(:card)).to eq card
    end

    it 'render show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before {get :new}

    it 'assign a new Card to @card' do
      expect(assigns(:card)).to be_a_new(Card)
    end

    it 'render new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before {get :edit, params: {id: card}}

    it 'assigns the requested card to @card' do
      expect(assigns(:card)).to eq card
    end

    it 'render show view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new card in database' do
        expect {post :create, params: {card: attributes_for(:card)}}.to change(Card, :count).by(1)
      end
      it 'redirects to show view' do
        post :create, params: {card: attributes_for(:card)}
        expect(response).to redirect_to card_path(assigns(:card))
      end
    end

    context 'with invalid attributes' do
      it 'does not save the card' do
        expect {post :create, params: {card: attributes_for(:invalid_card)}}.to_not change(Card, :count)
      end
      it 're-renders new view' do
        post :create, params: {card: attributes_for(:invalid_card)}
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    context 'valid attributes' do
      it 'assigns the requested card to @card' do
        patch :update, params: {id: card, card: attributes_for(:card)}
        expect(assigns(:card)).to eq card
      end

      it 'changes card attributes' do
        attributes = attributes_for(:new_card)
        patch :update, params: {id: card, card: attributes}
        card.reload
        expect(card.original_text).to eq attributes[:original_text]
        expect(card.translated_text).to eq attributes[:translated_text]
      end

      it 'redirect to updated card' do
        patch :update, params: {id: card, card: attributes_for(:card)}
        expect(response).to redirect_to :card
      end
    end
    context 'invalid attributes' do
      before do
        attributes = attributes_for(:invalid_card)
        patch :update, params: {id: card, card: attributes}
      end

      it 'does not changes card attributes' do
        old_attributes = attributes_for(:card)
        expect(card.original_text).to eq old_attributes[:original_text]
        expect(card.translated_text).to eq old_attributes[:translated_text]
      end

      it 're-renders edit view' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before { card }
    it 'deletes card' do
      expect { delete :destroy, params: {id: card}}.to change(Card, :count).by(-1)
    end

    it 'redirect to index view' do
      delete :destroy, params: {id: card}
      expect(response).to redirect_to cards_path
    end

  end
end
