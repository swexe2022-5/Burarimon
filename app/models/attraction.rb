class Attraction < ApplicationRecord
    has_many :reviews
    has_many :icons
end
