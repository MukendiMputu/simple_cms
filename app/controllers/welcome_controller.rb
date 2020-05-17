class WelcomeController < ApplicationController
  
  before_action :get_data, :only => [:index]

  def index
    
  end
  
  def search_booking
    @bookings = Booking.date_is(params[:date])
    logger.debug(@bookings)
    render('index')
    
  end
  
  private
  
    def get_data
      @bookings = Booking.oldest_first
      @rooms = Room.ordered
    end
end
