class WelcomeController < ApplicationController
  layout false
  
  def index
    @users = User.all
    @bookings = Booking.newest_first
    @rooms = Room.ordered

  end

  def search_booking
    
  end
end
