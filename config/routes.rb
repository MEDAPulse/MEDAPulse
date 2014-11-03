Rails.application.routes.draw do

  devise_for :users, :path => '',
    :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  resources :clients do
    resources :action_plans, shallow: true, except: [:index] do
      resources :goals, shallow: true, except: [:index] do
        resources :steps, shallow: true, except: [:index, :destroy] do
          resources :texts, shallow: true, except: [:index, :destroy]
        end
      end
    end
  end
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
  
end
