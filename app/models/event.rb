class Event < ApplicationRecord
  def self.past
    where(:date => ...(Date.today))
  end

  def self.upcoming
    where(:date => (Date.today)..)
  end

  belongs_to :creator, class_name: "User"

  has_many :event_attendees, foreign_key: "attended_event_id"
  has_many :attendees, through: :event_attendees, source: :attendee
end
