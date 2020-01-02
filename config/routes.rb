Rails.application.routes.draw do
  root 'static#welcomepage'
  resources :teams, only: [:index, :show]
  resources :drivers, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end