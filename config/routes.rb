Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login'
  get 'sessions/welcome'
  get 'drinks/search', to: 'drinks#search' 
  get 'drinks/search', to: 'drinks#handle_search' 
  get 'ingredients/search', to: 'ingredients#search'
  post 'ingredients/search', to: 'ingredients#handle_search'

  resources :drink_ingredients
  resources :ingredients
  resources :drinks
  resources :shelves
  resources :users
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
