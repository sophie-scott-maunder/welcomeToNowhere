Rails
  .application
  .routes
  .draw do
    resources :tickets
    root to: 'eyegum#index'

    get '/welcome_to_nowhere', to: 'welcome_to_nowhere#index'
    get '/welcome_to_nowhere/artists', to: 'artists#index'
    get '/welcome_to_nowhere/artists/:id', to: 'artists#show'
  end
