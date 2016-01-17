Rails.application.routes.draw do
  get 'sessions/new'

  root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  #TODO ここ何とかしたい。もう少しスマートにできないものか？
  post   'abc_phrases/:id' , to: 'abc_phrases#update'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :abc_phrases, only: [:show, :create, :update, :destroy]
end
