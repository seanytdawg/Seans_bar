Rails.application.routes.draw do
  get 'drinks/search', to: 'drinks#search' 
  post 'drinks/search', to: 'drinks#handle_search' 

  # resources :drink_ingredients
  # resources :ingredients
  resources :drinks
  resources :shelves
  resources :users

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
