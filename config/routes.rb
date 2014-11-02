Rails.application.routes.draw do
  
  get 'goals/new'

  get 'goals/create'

  get 'goals/show'

  get 'goals/edit'

  get 'goals/update'

  get 'action_plans/new'

  devise_for :users, :path => '',
    :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  resources :clients do
    resources :action_plans, shallow: true, except: [:index] do
      resources :goals, shallow: true, except: [:index, :show]
    end
  end
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
  
end
