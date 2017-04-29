Rails.application.routes.draw do
  resources :usines
  get 'pages/contact'

  get 'pages/about'

  get 'pages/dashboard'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
