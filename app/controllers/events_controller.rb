class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.build_creator(current_user)
    if @event.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:event).permit(:title, :date)
  end
end
