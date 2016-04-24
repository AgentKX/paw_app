Rails.application.routes.draw do
  devise_for :adopters
  devise_for :users
  get '/' => 'paws#index'
  get "/" => 'paws#index'
  get '/paws' => 'paws#index'
  get '/paws/new' => 'paws#new'
  post '/paws' => 'paws#create'
  get '/paws/:id' => 'paws#show'

  get '/favorite_paws' => 'favorite_paws#index'
  post '/favorite_paws' => 'favorite_paws#create'
  get '/favorite_paws/:id' => 'favorite_paws#index'
  delete '/favorite_paws/:id' => 'favorite_paws#delete'
  

  get '/paws_search' => 'paws#search_form'
  post '/paws_search' => 'paws#search_results'
end 

