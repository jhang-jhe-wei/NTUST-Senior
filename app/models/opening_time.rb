class OpeningTime < ApplicationRecord
    belongs_to :place, required: false
end
