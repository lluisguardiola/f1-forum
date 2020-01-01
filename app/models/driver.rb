class Driver < ApplicationRecord
    belongs_to :team
    has_many :results
    has_many :races, through: :results
    has_many :venues, through: :races
end
