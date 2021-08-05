Rails
  .application
  .routes
  .draw do
    resources :tickets
    root to: 'eyegum#index'

    get '/welcometonowhere', to: 'welcome_to_nowhere#index'
    get '/welcometonowhere/artists', to: 'artists#index'
    get '/welcometonowhere/artists/:id', to: 'artists#show'
  end
