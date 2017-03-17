Rails.application.routes.draw do
  resources :plans
  resources :admins

  get 'players/active', to: 'players#active'
  get 'players/inactive', to: 'players#inactive'
  resources :players

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
