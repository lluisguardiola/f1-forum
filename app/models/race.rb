class Race < ApplicationRecord
    has_many :results
    has_many :drivers, through: :results
    has_many :teams, through: :drivers
    belongs_to :venue

    def datetime
        dt = "#{self.date} #{self.time}".to_datetime.in_time_zone("America/Chicago")
        dt.strftime("%A, %B #{dt.day.ordinalize} of %Y at %H:%M CST")
    end

    def datetime_short
        self.datetime.split(" ").slice(1..4).join(" ")
    end
end
