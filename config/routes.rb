Rails.application.routes.draw do
  
  get 'action_plans/new'

  devise_for :users, :path => '',
    :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  resources :clients do
    resources :action_plans, shallow: true, except: [:index, :destroy]
  end
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
  
end
