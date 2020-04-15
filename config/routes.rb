Rails.application.routes.draw do
  
  root 'welcome#index'

  resources :users, :except => [:index, :new] do # :only => [:create]
    member do
      post :update
      get :signout
      get :delete
    end

    collection do
      get :signup
      get :signin
    end
  end
  
  
  
  #get 'welcome/index'
  #get 'welcome/index' # match "welcome/index", :to => "welcome#index", :via => :get
  
  # Default route 
  #get ':controller(/:action(/:id))'
end
