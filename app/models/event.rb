class Event < ApplicationRecord
    validates :start_date, presence: true
    validate :cant_be_in_the_past #attention c'est validate sans "s" quand on déclare une méthode
    validates :duration, presence: true
    validate :be_multiple_of_5 #attention c'est validate sans "s" quand on déclare une méthode
    validates :title, presence: true, length: { in: 5..140 }
    validates :description, presence: true, length: { in: 20..1000 }
    validates :price, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 1000 } #ou inclusion:{in:0..1000} 
    validates :location, presence: true
    
    belongs_to :admin, class_name: "User"

    has_many :attendances, dependent: :destroy
    has_many :participants, through: :attendances, class_name: 'User'

    #present? = not be blank https://blog.appsignal.com/2018/09/11/differences-between-nil-empty-blank-and-present.html
    def cant_be_in_the_past 
        if start_date.present? && start_date < Time.now #https://stackoverflow.com/questions/27210793/rails-getting-datetime-select-into-user-timezone-for-model-validation
        errors.add(:start_date, "can't be in the past")
        end
    end

    def be_multiple_of_5 
        unless duration.present? && duration > 0 && duration % 5 == 0 #https://stackoverflow.com/questions/51274453/ruby-round-integer-to-nearest-multiple-of-5/51292434
        errors.add(:duration, "must be multiple of 5")
        end
    end
end
