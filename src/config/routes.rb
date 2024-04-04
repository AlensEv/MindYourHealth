Rails.application.routes.draw do


  devise_for :healthcares
  #devise_scope :healthcare do
   # delete '/healthcares/sign_out', to: 'sessions#destroy', as :destroy_healthcares_session

   # end




  devise_for :admin
  #devise_scope :admin do
   # delete '/admin/sign_out', to: 'sessions#destroy', as: :destroy_admin_session
  #end



  devise_for :users
  #devise_scope :users do
  #  delete '/users/sign_out', to: 'sessions#destroy', as: :destroy_users_session
  #end

get 'diagnostics/articles'
# Define routes for the about page
get '/about', to: 'about#show', as: 'about_page'

# Define routes for the symptoms page
get '/symptoms', to: 'articles#symptoms', as: 'symptoms_page'

 resources :reports, only: [:create]
# Root route
root 'pages#home'
get '/home', to: 'pages#home', as: 'home_page'


get "articles/index"
get '/index', to: 'articles#index', as: 'index_page'

# Define routes for articles
get '/articles', to: 'articles#index'

# Define routes for different user types
get '/admin', to: 'articles#admins', as: 'admin_page'
get '/users', to: 'articles#users', as: 'users_page'
get '/healthcare', to: 'articles#healthcares', as: 'healthcarepro_page'
get '/diagnostics', to: 'diagnostics#articles', as: 'diagnosticso_page'

#DELETE '/healthcares/sign_out', to: 'devise/sessions#destroy', destroy_healthcare_session_path
#delete '/healthcares/sign_out', to: 'healthcares/healthcare_sessions#destroy', as: :destroy_healthcares_session
#post

post '/reports',  to: 'articles#save_reports'


# Define routes for different admin login


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  # Defines the root path route ("/")
  # root "posts#index"
end
