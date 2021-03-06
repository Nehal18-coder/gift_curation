Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace,
        defaults: { format: :jsonapi } do
    scope module: "api/v1", as: "api" do
      resources :bookmarks

      resources :categories

      resources :postcards

      resources :users
    end
    mount VandalUi::Engine, at: "/vandal"
    # your routes go here
  end
  ActiveAdmin.routes(self)
  root to: "users#index"
  resources :bookmarks
  resources :categories
  resources :postcards
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
