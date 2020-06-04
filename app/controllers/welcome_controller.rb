class WelcomeController < ApplicationController
  
  before_action :get_data, :only => [:index, :search_booking]

  def index
    @bookings = Booking.all
  end
  
  def search_booking
    sleep(1)
    @bookings = Booking.date_is(params[:date])

    respond_to do |format|
      format.js
      format.json { render json: @bookings }
    end 

    
  end
  
  private
  
    def get_data
      @bookings = Booking.oldest_first
      @rooms = Room.ordered
    end
end
