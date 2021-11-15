class Product < ApplicationRecord
    has_many :items
    has_many :shops , through: :items
end
