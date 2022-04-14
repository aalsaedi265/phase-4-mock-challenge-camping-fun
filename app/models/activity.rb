class Activity < ApplicationRecord

    has_many :signups, dependent: :destroy
    has_many :campers, through: :signups
end
# has_many :signups
    
# has_many :campers, through: :signups