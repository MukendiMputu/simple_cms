Rails.application.routes.draw do
  # Default route 
  #get ':controller(/:action(/:id))'

  root 'demo#index'

  get 'demo/index' # match "demo/index", :to => "demo#index", :via => :get
  match "demo/redir", :to => "demo#redir", :via => :get
  get 'demo/other_index'
  
end
