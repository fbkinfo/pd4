Donate::Application.routes.draw do
  
  root 'home#index'

  get 'auth/volunteeria/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'


  resource :receipt

end
