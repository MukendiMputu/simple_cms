module WelcomeHelper

    def show_bookings(object)
        render(
            :partial => 'welcome/bookings',
            :locals => { :object => object }
        )
    end

end
