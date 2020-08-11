Rails.application.routes.draw do
  resources :songs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/index", to: "songs#index"

  get "/show", to: "songs#show"

  get "/new", to: "songs#new"

end
