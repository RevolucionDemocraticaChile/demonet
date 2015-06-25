  Rails.application.routes.draw do
    root to: 'pages#welcome'

    get   '/ingresar'  => 'sessions#new'
    post  '/ingresar'  => 'sessions#create'
    delete 'salir'    => 'sessions#destroy'
    get   'mails_user_groups' => 'member_groups#mails'

    get '/users/list' => 'users#list', as: :users_list
    get '/users/manifest' => 'users#manifest', as: :users_manifest
    get '/users/manifest_file' => 'users#manifest_file', as: :users_manifest_file
    post '/users/manifest_file' => 'users#manifest_file'
    get '/meetings/list' => 'meetings#list', as: :meetings_list

    resources :users
    resources :groups
    resources :meetings do
      get :autocomplete_user_name, on: :collection
    end
    resources :user_meetings
    resources :meeting_groups
    resources :member_groups
    resources :admin_groups,       only: [:create, :destroy]
    resources :password_resets,    only: [:new, :create, :edit, :update]

    resources :payments
    resources :polls do
      resources :opinions
    end
    resources :opinions
  end
