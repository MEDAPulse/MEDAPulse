Rails.application.routes.draw do

  devise_for :users, :path => '',
    :path_names => {:sign_in => 'login', :sign_out => 'logout'}, 
    :controllers => { registrations: 'registrations' }

  resources :clients do
    resources :text_messages, shallow: true, except: [:index, :destroy]
    resources :action_plans, shallow: true, except: [:index] do
      resources :goals, shallow: true, except: [:index] do
        resources :steps, shallow: true, except: [:index, :destroy] do
        end
      end
    end
  end
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
  
end
