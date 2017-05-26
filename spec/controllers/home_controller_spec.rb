require 'rails_helper'
require 'home_controller.rb'

RSpec.describe CardsController, type: :controller do
  describe 'GET #index' do
    before {get :index}

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end
end
