Rails.application.routes.draw do

  resources :clients

  devise_for :users
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
  
end
