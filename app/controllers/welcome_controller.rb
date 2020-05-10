class WelcomeController < ApplicationController
  
  def index
    @users = User.all
    @bookings = Booking.all
    @rooms = Room.ordered
    
  end
  
  
  
  def search_booking
    @bookings = Booking.date_is(params[:date])
    
  end
end
