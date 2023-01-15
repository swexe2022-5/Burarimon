class Attraction < ApplicationRecord
    has_many :reviews
    has_many :icons
    validates :name, :text, :genre, :picture1, :prefecture, :address, :open_time, :contact, presence: true
    validates :name, length: { maximum: 100 }
end
