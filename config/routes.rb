Rails.application.routes.draw do
  devise_for :adopters
  devise_for :users
  get '/' => 'paws#index'
  get "/" => 'paws#index'
 
end
