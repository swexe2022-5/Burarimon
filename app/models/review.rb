class Review < ApplicationRecord
    belongs_to :attraction
    belongs_to :user
    validates :text, presence: true
end
