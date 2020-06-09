class Booking < ApplicationRecord
    # DB Associations: one-to-many, one-to-one
    belongs_to :user
    belongs_to :room
    has_many :notes
    has_many :invitations
    has_many :guests, :through => :invitations


    scope :oldest_first, lambda { order("created_at ASC") }
    scope :newest_first, lambda { order("created_at DESC") }
    scope :search, ->(query) { where(["agenda LIKE ?", "%#{query}%"])}
    scope :date_is, ->(query) { where("DATE(date) = ?", "#{query}")}
    scope :find_closest_match, ->(q_date, q_room) { where("DATE(date) = ? OR room_id = ?", "#{q_date}", "#{q_room}")}
    scope :order_by_start, lambda { order("start_time ASC") }
    scope :order_by_end, lambda { order("end_time ASC") }

end
