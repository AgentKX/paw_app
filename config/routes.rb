Rails.application.routes.draw do
  devise_for :adopters
  devise_for :users
 
  get '/' => 'paws#path'
  get '/paws' => 'paws#index'
  get '/paws/new' => 'paws#new'
  post '/paws' => 'paws#create'
  get '/paws/:id' => 'paws#show'
  get '/paws/:id/edit' => 'paws#edit'
  patch '/paws/:id' => 'paws#update'
  delete '/paws/:id' => 'paws#delete'

 
  get '/adopters' => 'adopters#index'
  # get '/adopters/new' => 'adopters#new'
  # post '/adopters' => 'adopters#create'
  get '/adopters/:id' => 'adopters#show'
  get '/adopters/:id/edit' => 'adopters#edit'
  patch '/adopters/:id' => 'adopters#update'
  get '/adopters:id' => 'adopters#delete'

 
  get '/users' => 'users#index'
  # post 'users' => 'users#create'
  get '/users/:id' => 'users#show' 
  get '/users/:id/edit' => 'users#edit'
  patch '/users/:id' => 'users#update'

  get '/favorite_paws' => 'favorite_paws#index'
  post '/favorite_paws' => 'favorite_paws#create'
  get '/favorite_paws/:id' => 'favorite_paws#index'
  delete '/favorite_paws/:id' => 'favorite_paws#delete'
  

  get '/paws_search' => 'paws#search_form'
  post '/paws_search' => 'paws#search_results'

  namespace :api do
    namespace :v1 do
      get '/paws' => 'paws#index'
      post '/pawsphoto' => 'paws#search_image'
      get '/external_paws' => 'external_paws#index'
    end
  end
end 

