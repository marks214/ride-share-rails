Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'trips#index'
  get '/trips', to: 'trips#index', as: 'trips'
  get '/drivers', to: 'drivers#index', as: 'drivers'

end
