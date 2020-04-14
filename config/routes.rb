Rails.application.routes.draw do
  
  root 'welcome#index'

  resources :users do
    member do
      post :signup
      post :signin
      get :delete
    end
  end
  
  
  
  #get 'welcome/index'
  #get 'welcome/index' # match "welcome/index", :to => "welcome#index", :via => :get
  
  # Default route 
  #get ':controller(/:action(/:id))'
end
