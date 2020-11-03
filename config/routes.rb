Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'trips#index'

  get '/drivers/new', to: 'drivers#new'
  get '/trips', to: 'trips#index', as: 'trips'
  get '/drivers', to: 'drivers#index', as: 'drivers'
  get '/drivers/:id', to: 'drivers#show', as: 'driver'

end
