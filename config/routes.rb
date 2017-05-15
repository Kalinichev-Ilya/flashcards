Rails.application.routes.draw do
  get 'home/index'
  get 'Все_карточки', to: 'cards#index', as: 'cards/index'

  root 'home#index'

end
