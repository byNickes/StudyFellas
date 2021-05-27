Rails.application.routes.draw do
  devise_for :users, skip:[:passwords, :registrations], :controllers => { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #ROOT
    root :to => 'groups#index'
  ##

  get '/exams', to: 'exams#index', :as => :exams
  get '/exams/create_exam_form', to: 'exams#create', :as => :create_exam
  post '/exams/new_exam', to: 'exams#new', :as => :new_exam
  delete '/exams/delete_exam', to: 'exams#delete', :as => :delete_exam

  get '/users/profile', to: 'profiles#show', :as => :profile
  get '/users/profile/edit_profile_form', to: 'profiles#edit', :as => :edit_profile
  post '/users/profile/update_profile', to: 'profiles#update', :as => :update_profile

  # devise_for:users PER TUTTE LE ROUTES
  resources :groups
end
