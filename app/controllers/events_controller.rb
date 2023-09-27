class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.build_creator(id: current_user.id)
    if @event.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :date)
  end
end
