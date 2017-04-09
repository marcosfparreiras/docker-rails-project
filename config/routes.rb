Rails.application.routes.draw do
  root to: 'sessions#new'
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :document_types
  resources :plans
  resources :admins

  resources :players do
    collection do
      get 'active'
      get 'inactive'
    end
  end

  namespace :documents do
    resources :pendings do
      get 'index'
      get 'pending', to: :edit
      put 'pending', to: :update, as: 'edit_pending'
    end
  end

  resources :documents

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
