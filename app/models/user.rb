class User < ApplicationRecord
    has_many :reviews
    validates :name, :pass, :profile, presence: true
    validates :name, length: { maximum: 30 }, uniqueness: true
    validates :password, confirmation: true
    
    attr_accessor :password, :password_confirmation

    def password=(val)
        if val.present?
            self.pass = BCrypt::Password.create(val)
        end
        @password = val
    end
end
