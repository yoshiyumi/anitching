class Work < ApplicationRecord
    belongs_to :tag
    belongs_to :genre
    has_many :reviews, dependent: :destroy
    belongs_to :ranking
end
