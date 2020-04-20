class User < ApplicationRecord
    has_many :bookings
    has_many :invitations, :through => :bookings
    has_many :guests, :through => :invitations
    has_secure_password
    
    EMAIL_REGEX = /A[a-zA-Z0-9\.]+@[a-zA-Z0-9]+((\-)?[a-zA-Z0-9]+(\.)?[a-zA-Z0-9]{2,6}?)?\.[a-zA-Z]{2,6}z/

    validates :first_name,  :presence => true,
                            :length => {:maximum => 25}

    validates :last_name,   :presence => true,
                            :length => {:maximum => 50}
   
    validates :nickname,    :presence => true,
                            :length => {:within => 8..25},
                            :uniqueness => true
           
    validates :email,   :presence => true,
                        :length => {:maximum => 255},
                        :format => {:with => EMAIL_REGEX},
                        :uniqueness => true,
                        :confirmation => true
end
