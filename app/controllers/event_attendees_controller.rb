class EventAttendeesController < ApplicationController
  def create
    @event_attendee = EventAttendee.new(event_attendee_params)

    @event_attendee.save unless EventAttendee.find_by(attendee_id: current_user.id)
    redirect_to root_path
  end

  private

  def event_attendee_params
    params.require(:event_attendee).permit(:attendee_id, :attended_event_id)
  end
end
