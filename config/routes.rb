Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'trips#index'
  get '/trips', to: 'trips#index', as: 'trips'

  # Passengers routes
  get '/passengers', to: 'passengers#index', as: 'passengers'
  get '/passengers/new', to: 'passengers#new', as: 'new_passenger'
  post '/passengers', to: 'passengers#create'

  get '/passengers/:id', to: 'passengers#show', as: 'passenger'
  get '/passengers/:id/edit', to: 'passengers#edit', as: 'edit_passenger'
  patch '/passengers/:id', to: 'passengers#update'
  delete '/passengers/:id', to: 'passengers#destroy'

end
