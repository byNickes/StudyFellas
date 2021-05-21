Rails.application.routes.draw do
  devise_for :users, skip:[:passwords, :registrations], :controllers => { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # ROUTES PER LOGIN

 # get '/users/sign_in', to: 'devise/sessions#new', :as => :new_user_session
 # post '/users/sign_in', to: 'devise/sessions#create', :as => :user_session
 # delete '/users/sign_out', to: 'devise/sessions#destroy', :as => :destroy_user_session

  # devise_for:users PER TUTTE LE ROUTES
end
