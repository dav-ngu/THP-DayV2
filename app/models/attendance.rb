class Attendance < ApplicationRecord
    belongs_to :event
    belongs_to :participant, class_name: "User"

    after_create :send_confirmation

    def send_confirmation
        AttendanceMailer.participation_confirmation(self).deliver_now
    end
end
