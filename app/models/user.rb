class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_events, foreign_key: "creator_id", class_name: "Event"

  has_many :event_attendees, foreign_key: "attendee_id", dependent: :destroy
  has_many :invitations, foreign_key: "invited_user_id", dependent: :destroy
  
  has_many :attended_events, -> { where('event_attendees.approved = ?', true) }, through: :event_attendees, source: :attended_event
  has_many :pending_attendance_events, -> { where('event_attendees.approved = ?', false) }, through: :event_attendees, source: :attended_event
  has_many :invited_events, through: :invitations, source: :invited_event

  validates :name, presence: true, uniqueness: true
end
