class EventAttendee < ApplicationRecord
  belongs_to :event, foreign_key: "attended_event_id"
  belongs_to :user, foreign_key: "attendee_id"
end
