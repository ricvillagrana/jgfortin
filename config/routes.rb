Rails.application.routes.draw do
  root 'homeowner_insurances#index'

  resources :homeowner_insurances, only: %i[show create new] do
    resources :callback_requests, only: %i[show create new]

    collection do
      get '/', to: redirect('/homeowner_insurances/new')
      get 'quote', to: redirect('/homeowner_insurances/new')
      post 'quote', to: 'homeowner_insurances#quote'
    end
  end
end
