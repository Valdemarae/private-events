class Event < ApplicationRecord
  scope :past, -> { where(date: ...(Date.today)) }
  scope :upcoming, -> { where(date: (Date.today)..)}

  belongs_to :creator, class_name: "User"

  has_many :event_attendees, foreign_key: "attended_event_id", dependent: :destroy
  has_many :attendees, through: :event_attendees, source: :attendee

  validates :title, :presence => true
  validates :date, :presence => true
end
