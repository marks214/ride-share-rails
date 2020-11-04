Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # TODO: change root route to homepages after merge
  root to: 'trips#index'
  get '/trips', to: 'trips#index', as: 'trips'

  # driver routes
  get '/drivers', to: 'drivers#index', as: 'drivers'
  get '/drivers/new', to: 'drivers#new', as: 'new_driver'
  post '/drivers', to: 'drivers#create'


  get '/drivers/:id', to: 'drivers#show', as: 'driver'
  get '/drivers/:id/edit', to: 'drivers#edit', as: 'edit_driver'
  patch '/drivers/:id', to: 'drivers#update'
  get 'drivers/:id/confirm_delete', to: 'drivers#confirm', as: 'confirm_driver'
  delete '/drivers/:id', to: 'drivers#delete'

  # Passengers routes
  get '/passengers', to: 'passengers#index', as: 'passengers'
  get '/passengers/new', to: 'passengers#new', as: 'new_passenger'
  post '/passengers', to: 'passengers#create'

  get '/passengers/:id', to: 'passengers#show', as: 'passenger'
  get '/passengers/:id/edit', to: 'passengers#edit', as: 'edit_passenger'
  patch '/passengers/:id', to: 'passengers#update'
  delete '/passengers/:id', to: 'passengers#destroy'
end
