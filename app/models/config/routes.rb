Rails.application.routes.draw do
  resources :players
  resources :plans
  resources :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end