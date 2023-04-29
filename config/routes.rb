Rails.application.routes.draw do
  root 'homeowner_insurances#index'

  resources :homeowner_insurances, only: %i[show new create]
  post 'homeowner_insurances/new', to: 'homeowner_insurances#new_from_quote'
end
