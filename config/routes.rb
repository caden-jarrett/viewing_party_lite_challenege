Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 get '/', to: 'welcome#index'
 get '/register', to: 'users#new'
 post '/register', to: 'users#create'
 get '/dashboard', to: 'users#show'
 post '/dashboard', to: 'parties#create'
 get '/login', to: 'sessions#login_form'
 post '/login', to: 'sessions#login'
 delete '/logout', to: 'sessions#destroy'
#  post '/users/:id/movies/:id/parties/new', to: 'parties#create'
 
  get '/users', to: 'users#new'
  post '/users', to: 'users#create'
  get '/users/discover', to: 'movies#discover', as: 'movies_discover'

  get '/users/movies', to: 'movies#top_rated', as: 'top_rated'
  post '/users/movies/:id/parties', to: 'parties#create'
  get '/users/movies_search', to: 'movies#search', as: 'search'
  get '/movies/:id', to: 'movies#show'
  get '/users/movies/:id/new_party', to: 'parties#new'

  resources :movies, only: %i[index show] do
    resources :parties, only: %i[create new]
  end
end

