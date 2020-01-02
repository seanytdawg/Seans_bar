class User < ApplicationRecord
    has_many :shelves
    has_many :drinks, through: :shelves
    # has_secure_password

    validates :username, :password, presence: true
    validates :username, :password,  uniqueness: true

    
end
