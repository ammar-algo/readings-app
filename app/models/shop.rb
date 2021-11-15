class Shop < ApplicationRecord
    belongs_to :user
    has_many :items
    has_many :products , through: :items
end
