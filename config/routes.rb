Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'
  
  resources :users, only: [:index, :show]
  #resources :likes, only: [:destroy]
  resources :posts, only: [:index, :show, :create] do
    resources :likes, only: [:create, :destroy]
  end
  
end
