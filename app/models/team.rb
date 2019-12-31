class Team < ApplicationRecord
    has_many :drivers
    has_many :results, through: :drivers
    has_many :races, through: :results
    has_many :venues, through: :races
end
