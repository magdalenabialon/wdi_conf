Rails.application.routes.draw do

  resources :attendances
  resources :seats
  resources :likes
  # get 'charges/new'
  # get 'charges/create'

  get "/dashboard" => "dashboard#show"

  get "/auth/auth0/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"

  resources :afterevents
  resources :bookings
  resources :speeches
  resources :users
  resources :charges

  namespace :api do
    resources :quizzes
    resources :seats
  end



  get '/', to: 'main#index'
  get '/map', to: 'main#map'
  get '/seat', to: 'bookings#choose_seat'

  get '/user/show', to: 'users#show'
  get '/user', to: 'users#index'
  get '/logout', to: 'users#delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
