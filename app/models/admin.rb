class Admin < ApplicationRecord
    has_secure_password  # This requires the bcrypt gem
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
end
