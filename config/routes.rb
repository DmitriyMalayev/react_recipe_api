Rails.application.routes.draw do    #config/routes.rb
  resources :recipes
  resources :cuisines, except: [:update, :destroy] 
  devise_for :users, path: '', path_names: {
    
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end