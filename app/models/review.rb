class Review < ApplicationRecord
    belongs_to :user
    has_one :race
end
