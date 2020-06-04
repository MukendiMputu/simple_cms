module WelcomeHelper

    def show_bookings(object)
        render(
            :partial => 'bookings',
            :locals => { :object => object }
        )
    end

end
