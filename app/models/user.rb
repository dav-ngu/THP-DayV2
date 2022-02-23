class User < ApplicationRecord

    has_many :organized_events, foreign_key: 'admin_id', class_name: "Event", dependent: :destroy
    
    has_many :attendances, dependent: :destroy
    has_many :events, through: :attendances

    after_create :welcome_send

    def welcome_send
      UserMailer.welcome_email(self).deliver_now
    end

end
