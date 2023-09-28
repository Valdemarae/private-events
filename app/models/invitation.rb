class Invitation < ApplicationRecord
  belongs_to :invited_user, class_name: "User"
  belongs_to :invited_event, class_name: "Event"
end
