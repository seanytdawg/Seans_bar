class User < ApplicationRecord
    has_many :shelves
    has_many :drinks, through: :shelves

    validates :username, :password, presence: true
    validates :username, :password,  uniqueness: true
end
