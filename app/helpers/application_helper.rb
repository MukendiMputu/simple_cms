module ApplicationHelper
    
    # Defining a method to render the error display partial
    def error_messages_for(object)
        render(
            :partial => 'application/error_messages',
            :locals => { :object => object }
        )
    end

    def show_logged_header()
        render(
            :partial => 'application/logged_header'
        )
    end

    def show_default_header(object)
        render(
            :partial => 'application/header',
            :locals => {:object => object}
        )
    end

    def is_logged_in()
        return session[:user_id].present?
    end
end
