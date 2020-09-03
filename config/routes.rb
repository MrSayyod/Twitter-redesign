Rails.application.routes.draw do
  resources :posts
  resource :session
  resources :users
  root "posts#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
