Rails.application.routes.draw do

require 'sidekiq/web'

  devise_for :users, :path => '',
    :path_names => {:sign_in => 'login', :sign_out => 'logout'}, 
    :controllers => { registrations: 'registrations' }

  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :clients do
    resources :action_plans, shallow: true, except: [:index] 
  end
  
  resources :action_plans, shallow: true, only: [] do
    resources :goals, shallow: true, except: [:index]
  end

  resources :goals, shallow: true, only: [] do
    resources :steps, shallow: true, except: [:index, :destroy]
  end

  resources :steps, shallow: true, only: [] do
    resources :text_messages, shallow: true, except: [:index, :destroy]
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
  
end
