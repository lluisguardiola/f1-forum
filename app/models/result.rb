class Result < ApplicationRecord
    belongs_to :driver
    has_one :race
    has_one :venue, thorugh: :race
end
