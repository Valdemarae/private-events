class AddApprovedToEventAttendees < ActiveRecord::Migration[7.0]
  def change
    add_column :event_attendees, :approved, :boolean, :default => false
  end
end
