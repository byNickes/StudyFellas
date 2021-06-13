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
  delete '/users/profile/delete_profile_picture', to: 'profiles#delete_profile_picture', :as => :delete_profile_picture

  get 'new_belonging', to: 'belongings#new', :as => :new_belonging
  delete 'delete_belonging', to: 'belongings#destroy', :as => :destroy_belonging

  get '/groups/:id/requests', to: 'requests#index', :as => :requests
  get 'new_request', to: 'requests#new', :as => :new_request
  delete 'accept_request', to: 'requests#accept', :as => :accept_request
  delete 'refuse_request', to: 'requests#refuse', :as => :refuse_request

  # devise_for:users PER TUTTE LE ROUTES
  resources :groups
  post '/groups/upload_file', to: 'groups#upload_file', :as => :upload_file
  delete '/groups/delete_file', to: 'groups#delete_file', :as => :delete_file
  post '/groups/search', to: 'groups#search', :as => :search_group
  post '/groups/delete_group', to: 'groups#delete_group', :as => :delete_group
  post '/groups/delete_participant', to:'groups#delete_participant', :as => :delete_participant
  post '/groups/:id/kick_user', to:'groups#kick_user', :as => :kick_user
end
