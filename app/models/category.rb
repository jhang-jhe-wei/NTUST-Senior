class Category < ApplicationRecord
    has_many :clubs, dependent: :destroy
end
