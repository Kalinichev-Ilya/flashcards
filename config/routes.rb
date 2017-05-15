Rails.application.routes.draw do
  get 'home/index'
  get 'cards', to: 'cards#index'

  root 'home#index'
end
