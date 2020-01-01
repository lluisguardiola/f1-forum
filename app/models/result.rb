class Result < ApplicationRecord
    belongs_to :race
    has_one :driver
    has_one :venue, through: :race
end
