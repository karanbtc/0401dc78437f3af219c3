Rails.application.routes.draw do
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/api/users" => "users#index"
  get "/api/user/:id" => "users#show"
  post "/api/user" => "users#create"
  put "/api/user/:id" => "users#update"
  delete "/api/user/:id" => "users#destroy"
  get "/api/typeahead/:input" => "users#search"
end