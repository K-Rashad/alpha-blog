Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "page#home"
  get 'about', to: 'page#about'
  resources :articles
  get "signup", to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :categories, except: [:destroy]
  resources :likes, except: [:destroy, :edit, :new, :index, :show]


  # , only: [:show, :index, :new, :create,:edit,:update, :destroy]
end
