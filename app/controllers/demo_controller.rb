class DemoController < ApplicationController
  def index
    @array = [1, 2, 3, 4, 5]

    render(:template => 'demo/index') 
  # render('demo/index') or just
  # render('index')
  end

  def other_index
    render(:template => 'demo/other_index')
  end

  def redir
    redirect_to(:controller => 'demo', :action => 'other_index')
  # redirect_to("www.google.com")
  end
end
