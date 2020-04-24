module ApplicationHelper
    
    # Defining a method to render the error display partial
    def error_messages_for(object)
        render(
            :partial => 'application/error_messages',
            :locals => { :object => object }
        )
    end
end
