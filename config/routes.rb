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
  end

  get '/', to: 'main#index'
  get '/map', to: 'main#map'
  get '/seat', to: 'bookings#choose_seat'

  get '/user/show', to: 'users#show'
  get '/user', to: 'users#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# # getting the login form
# get '/login', to: 'session#new'
# # creating a session / logging in
# post '/session', to: 'session#create'
# # destroying a session / logging out
# delete '/session', to: 'session#destroy'
