class WelcomeController < ApplicationController
  
  before_action :get_data, :only => [:index, :search_booking]

  def index
    
  end
  
  def search_booking
    sleep(1)
    
    # Fetch all the bookings matching the date OR the room number
    @bookings = Booking.find_closest_match(params[:date], params[:number]).order_by_start

    respond_to do |format|
      format.js
    end 

    
  end
  
  private
  
    def get_data
      @bookings = Booking.oldest_first
      @rooms = Room.ordered
    end
end
