Rails.application.routes.draw do
  get "connect" => "connects#index"
  resources :posts, except: [:show]
  resource :session, only: [:new, :create, :destroy]
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :followships, only: [:create, :destroy]
  root "posts#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
