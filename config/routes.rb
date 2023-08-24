Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/', to: 'welcome#index'
  
  get '/breweries', to: 'breweries#index'
  get '/brewery/:id', to: 'breweries#show'
  get '/brewery/:id/beers', to: 'breweries#show_beers'

  get '/beers', to: 'beer#index'
  get '/beer/:id', to: 'beer#show'
end
