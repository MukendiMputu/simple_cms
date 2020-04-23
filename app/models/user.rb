class User < ApplicationRecord
    has_many :bookings
    has_many :invitations, :through => :bookings
    has_many :guests, :through => :invitations
    
    has_secure_password
    has_one_attached :picture
    
    EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

    validates :first_name,  :presence => true,
                            :length => {:maximum => 25},
                            :on => :create

    validates :last_name,   :presence => true,
                            :length => {:maximum => 50},
                            :on => :create
   
    validates :nickname,    :presence => true,
                            :length => {:within => 8..25},
                            :uniqueness => true,
                            :on => :create
           
    validates :email,   :presence => true,
                        :length => {:maximum => 255},
                        :format => {:with => EMAIL_REGEX},
                        :uniqueness => true,
                        :confirmation => true,
                        :on => :create
    
    validates :password,    :presence => true,
                            :length => {:within => 8..16},
                            :confirmation => true,
                            :on => :create
    
    #validates :confirm_pwd,     :presence => true, :on => :create                             
end
