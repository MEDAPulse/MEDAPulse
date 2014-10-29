Rails.application.routes.draw do
  
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  resources :clients
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
  
end
