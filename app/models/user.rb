class User < ApplicationRecord
    has_many :bookings
    has_many :guests, :through 
end
