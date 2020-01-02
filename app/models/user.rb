class User < ApplicationRecord
    has_many :shelves
    has_many :drinks, through: :shelves
    has_secure_password

    
end
