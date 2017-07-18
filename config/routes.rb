Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles do
    resources :comments, only:  [:create]
  end

  root 'welcome#index'



  end




