  Rails.application.routes.draw do
    root to: 'pages#welcome'

    get   '/ingresar'  => 'sessions#new'
    post  '/ingresar'  => 'sessions#create'
    delete '/salir'    => 'sessions#destroy'
    get   'mails_user_groups' => 'member_groups#mails'

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
  end
