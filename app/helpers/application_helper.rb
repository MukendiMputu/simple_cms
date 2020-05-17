module ApplicationHelper
    
    # Defining a method to render the error display partial
    def error_messages_for(object)
        render(
            :partial => 'application/error_messages',
            :locals => { :object => object }
        )
    end


    def show_default_header
        render(:partial => 'application/header')
    end

    def is_logged_in()
        return session[:user_id].present?
    end
end
