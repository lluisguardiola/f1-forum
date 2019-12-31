class Race < ApplicationRecord
    has_one :venue
    has_many :results
    has_many :drivers, through: :results
    has_many :teams, through: :drivers
end
