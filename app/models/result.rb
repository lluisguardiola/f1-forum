class Result < ApplicationRecord
    belongs_to :race
    belongs_to :driver
    
    def venue
        self.race.venue
    end

    def racetime
        first_place = self.race.results.order(place: :asc).first
        
        if self == first_place
            self.race_time
        elsif self.status == "Finished"
            min = self.race_time.slice(1)
            sec = self.race_time.slice(3..4)
            ms = self.race_time.slice(6..8)

            "#{first_place.race_time} +#{min}m #{sec}s #{ms}ms"
        else
            "did not complete all laps."
        end
    end

    def total_gp_laps
        self.race.results.order(laps: :desc).first.laps
    end

    def modifiedformat_fastest_lap_time
        min = self.fastest_lap_time.slice(0)
        sec = self.fastest_lap_time.slice(2..3)
        ms = self.fastest_lap_time.slice(5..7)

        if self.fastest_lap_time
            "#{min}m #{sec}s #{ms}ms"
        else
            "did not complete a single lap in this race."
        end
    end
    
end
