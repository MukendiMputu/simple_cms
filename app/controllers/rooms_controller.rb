class RoomsController < ApplicationController
  def show
    @room = Room.find_by_id(params[:format]);
  end
end
