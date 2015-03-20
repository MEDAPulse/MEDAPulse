Rails.application.routes.draw do

  devise_for :users, :path => '',
    :path_names => {:sign_in => 'login', :sign_out => 'logout'}, 
    :controllers => { registrations: 'registrations' }

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
    resources :text_messages, shallow: true, except: [:index]
  end

  get "text_messages/receive"
  match 'salty-coast-5328.herokuapp.com/receivetext' => 'text_messages#receive', :via => :post

  resources :clients do
    collection do
      post :welcome
    end
  end

  get 'group_new' => 'text_messages#group_new' 
  post 'group_create' => 'text_messages#group_create'

  root to: 'welcome#index'
  
end
