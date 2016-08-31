Rails.application.routes.draw do
  resources :bookings
  resources :speeches
  resources :users

  get '/', to: 'main#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
