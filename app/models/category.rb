class Category < ApplicationRecord
    has_many :categorizations
    has_many :blogs, through: :categorizations
end
