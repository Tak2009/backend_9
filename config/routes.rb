Rails.application.routes.draw do
  # resources :londonusers
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  get "/london_users", to:"londonusers#index", as:"london_users"

end

