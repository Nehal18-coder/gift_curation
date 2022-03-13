Rails.application.routes.draw do
  root :to => "users#index"
  resources :bookmarks
  resources :categories
  resources :postcards
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
