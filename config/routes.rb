Rails.application.routes.draw do
  resources :bands do
    resources :albums
  end
  resources :types
  resources :statuses
  resources :genres
  resources :users
  post :login, to: "login#create"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
