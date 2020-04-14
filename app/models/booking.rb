class Booking < ApplicationRecord
    # DB Associations: one-to-many, one-to-one
    belongs_to :user
    belongs_to :room
    has_many :notes
    has_many :invitations

    scope :oldest_first, lambda { order("created_at ASC") }
    scope :newest_first, lambda { order("created_at DESC") }
    scope :search, ->(query) { where(["agenda LIKE ?", "%#{query}%"])}
end
