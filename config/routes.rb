Rails.application.routes.draw do

  get 'institutes/leaderboard'

  get 'staticpages/about'

  get 'staticpages/contact-us'

  #resources :users, :only => [:index, :show] #devise doesn't provide options to show profiles and index
  devise_for :users, :path_prefix => 'd'
  get 'users/:id' => 'users#show'
  get 'users' => 'users#index'
  get 'events/index'
  get 'events/add'
  
  resources :ideas
  resources :categories
  resources :institutes
  root to:'ideas#index'
  
end
