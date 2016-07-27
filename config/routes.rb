Rails.application.routes.draw do

  get 'institutes/leaderboard'
  get 'about' => 'staticpages#landing'
  

  #resources :users, :only => [:index, :show] #devise doesn't provide options to show profiles and index
  devise_for :users, :path_prefix => 'd'
  get 'users/:id' => 'users#show'
  get 'users' => 'users#index'
  get 'events' => 'events#index'
  get 'events/add'
  
  resources :ideas do
    member do
     put "support", to: "ideas#upvote"
     put "unsupport", to: "ideas#removevote"
    end
  end
  
  resources :ideas
  resources :categories
  resources :institutes
  resources :posts
  
  authenticated :user do
    root to: "ideas#index", as: :authenticated_root
  end
  
  unauthenticated do
    root to: "staticpages#landing"
  end
  
end
