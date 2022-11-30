class Review < ApplicationRecord
    belongs_to :attraction
    belongs_to :user
end
