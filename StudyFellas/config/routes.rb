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
 # post '/users/sign_in', to: 'devise/sessions#create', :as => :user_session
 # delete '/users/sign_out', to: 'devise/sessions#destroy', :as => :destroy_user_session

  # devise_for:users PER TUTTE LE ROUTES
  resources :groups
end
