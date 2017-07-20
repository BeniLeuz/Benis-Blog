Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:update]
  get 'welcome/index'

  resources :articles do
    resources :comments, only:  [:create, :destroy,]
  end

  root 'welcome#index'



  end




