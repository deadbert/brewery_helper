Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/', to: 'welcome#index'
  
  get '/breweries', to: 'breweries#index'
  get '/breweries/:id', to: 'breweries#show'
  get '/breweries/:id/beers', to: 'breweries#show_beers'
  get '/breweries/:id/edit', to: 'breweries#edit'
  get '/breweries/new', to: 'breweries#new'
  get '/breweries/:id/beers/new', to: 'beer#new'

  post '/breweries/:id/beers', to: 'beer#create'
  post '/breweries/create', to: 'breweries#create'
  
  patch '/breweries/:id', to: 'breweries#update'

  get '/beers', to: 'beer#index'
  get '/beers/:id', to: 'beer#show'
end
