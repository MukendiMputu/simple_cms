Rails.application.routes.draw do
  
  root 'welcome#index'
  post 'welcome/search_booking'

  resources :users, :only => [:show, :create] do # :except => [:index, :new]
    member do
      get :signout
      get :delete
    end

    collection do
      get :signup
      post :signin
    end
  end
  
  
  #get 'welcome/index' # match "welcome/index", :to => "welcome#index", :via => :get
  
  # Default route 
  #get ':controller(/:action(/:id))'
end
