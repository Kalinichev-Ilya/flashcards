Rails.application.routes.draw do
  get 'home/index'

  root 'home#index'
  get 'check' => 'training#check'
  resources :cards
end
