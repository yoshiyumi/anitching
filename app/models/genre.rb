class Genre < ApplicationRecord
    has_many :works, dependent: :destroy
end
