class Place < ApplicationRecord
    has_many :opening_times, dependent: :destroy
end
