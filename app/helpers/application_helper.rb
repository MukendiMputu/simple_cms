module ApplicationHelper
    
    # Defining a method to render the error display partial
    def error_messages_for(object)
        render(
            :partial => 'application/error_messages',
            :locals => { :object => object }
        )
    end

    def show_logged_header(object)
        render(
            :partial => 'application/logged_header',
            :locals => {:object => object}
        )
    end
end
