Rails.application.routes.draw do
  resources :bookings
  resources :speeches
  resources :users

  namespace :api do
    resources :quizzes
  end

  get '/', to: 'main#index'
  get '/map', to: 'main#map'
  get '/seat', to: 'bookings#choose_seat'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
