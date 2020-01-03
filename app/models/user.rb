class User < ApplicationRecord
    has_many :reviews
    
    validates_uniqueness_of :username, :email
end
