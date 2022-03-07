Rails.application.routes.draw do
  resources :categories
  resources :my_wishes
  devise_for :stores
  resources :stores
  resources :gifts
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
