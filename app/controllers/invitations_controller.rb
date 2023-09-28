class InvitationsController < ApplicationController
  def new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.save
    redirect_to new_invitation_path(id: @invitation.invited_event_id)
  end

  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy
    redirect_to user_path(@invitation.invited_user_id)
  end

  def accept
    @invitation = Invitation.find(params[:id])
    event_attendee = EventAttendee.find_by(attendee_id: @invitation.invited_user_id, attended_event_id: @invitation.invited_event_id)
    unless event_attendee
      event_attendee = EventAttendee.new(attendee_id: @invitation.invited_user_id, attended_event_id: @invitation.invited_event_id)
    end
    event_attendee.update(approved: true)
    @invitation.destroy
    redirect_to user_path(@invitation.invited_user_id)
  end

  private

  def invitation_params
    params.require(:invitation).permit(:invited_user_id, :invited_event_id)
  end 
end
