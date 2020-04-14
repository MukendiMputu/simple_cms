Rails.application.routes.draw do
  get 'users/signup'
  get 'users/signin'
  get 'users/show'
  get 'users/edit'
  # Default route 
  #get ':controller(/:action(/:id))'
  
  root 'welcome#index'
  
  get 'welcome/index'
  #get 'welcome/index' # match "welcome/index", :to => "welcome#index", :via => :get
  
end
