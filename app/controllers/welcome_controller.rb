class WelcomeController < ApplicationController
  
  before_action :get_data, :only => [:index, :search_booking]

  def index
    
  end
  
  def search_booking
    @bookings = Booking.date_is(params[:date])
    logger.debug("++++++++++++ [ DEBUGGING ] ++++++++++++")
    @bookings.each do |b|
      logger.debug(b.agenda)
    end
    logger.debug("+++++++++++++++++++++++++++++++++++++++")
    
    render('index')
    
  end
  
  private
  
    def get_data
      @bookings = Booking.oldest_first
      @rooms = Room.ordered
    end
end
