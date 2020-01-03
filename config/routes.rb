Rails.application.routes.draw do
  get 'reviews/index'
  get 'reviews/show'
  get 'reviews/new'
  get 'reviews/edit'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'static#welcomepage'
  resources :teams, only: [:index, :show]
  resources :drivers, only: [:index, :show]
  resources :races, only: [:index, :show]
  resources :venues, only: [:index, :show]
  resources :results, only: :show
end