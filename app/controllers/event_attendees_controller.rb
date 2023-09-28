class EventAttendeesController < ApplicationController
  def create
    @event_attendee = EventAttendee.new(event_attendee_params)

    @event_attendee.save unless EventAttendee.exists?(attendee_id: @event_attendee.attendee_id, attended_event_id: @event_attendee.attended_event_id)
    redirect_to event_path(@event_attendee.attended_event_id)
  end

  def destroy
    @event_attendee = EventAttendee.find(params[:id])
    @event_attendee.destroy
    redirect_to event_path(params[:id])
  end

  def update
    @event_attendee = EventAttendee.find(params[:id])
    invitation = Invitation.find_by(invited_event_id: @event_attendee.attended_event_id, invited_user_id: @event_attendee.attendee_id)
    invitation.destroy if invitation
    @event_attendee.update(approved: true)
    redirect_to event_path(@event_attendee.attended_event_id)
  end

  private

  def event_attendee_params
    params.require(:event_attendee).permit(:attendee_id, :attended_event_id)
  end
end
