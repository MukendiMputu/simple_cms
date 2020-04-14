class User < ApplicationRecord
    has_many :bookings
    has_many :invitations, :through => :bookings
    has_many :guests, :through => :invitations
end
