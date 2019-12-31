class User < ApplicationRecord
    has_many :shelves
    has_many :drinks, through: :shelves
end
