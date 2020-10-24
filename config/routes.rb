Rails.application.routes.draw do
  get 'rooms/show'
  get 'rooms/index'
  root 'welcome#index'
  post 'welcome/search_booking'
  
  resources :users, :only => [:new, :create, :edit, :destroy] do # :except => [:index, :new]
    member do
      get :delete
      post :edit
    end
    
    collection do
    end
  end

  resources :login, :only => [:index, :create, :show, :delete] do
    member do
      get :delete
    end

    collection do
    end
  end
  
  
  #get 'welcome/index' # match "welcome/index", :to => "welcome#index", :via => :get
  
  # Default route 
  #get ':controller(/:action(/:id))'
end
