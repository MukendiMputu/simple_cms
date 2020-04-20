Rails.application.routes.draw do
  
  get 'sessions/signin'
  get 'sessions/show'
  get 'sessions/edit'
  get 'sessions/signout'
  root 'welcome#index'
  post 'welcome/search_booking'

  resources :users, :only => [:show, :create, :edit] do # :except => [:index, :new]
    member do
      get :delete
    end

    collection do
      get :signup
    end
  end

  resources :sessions, :only => [:show, :edit] do
    member do
      get :signout
    end

    collection do
      get :signin
    end
  end
  
  
  #get 'welcome/index' # match "welcome/index", :to => "welcome#index", :via => :get
  
  # Default route 
  #get ':controller(/:action(/:id))'
end
