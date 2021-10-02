class Work < ApplicationRecord
    has_many :tagmaps, dependent: :destroy
    has_many :tags, through: :tagmaps
    belongs_to :genre
    belongs_to :customer
    has_many :reviews, dependent: :destroy
    has_many :favorites, dependent: :destroy

    attachment :image

    accepts_nested_attributes_for :tags, allow_destroy: true

    validates :name, presence: true

    def self.looks(search, word)
        if search == "perfect_match"
          @work = Work.where("name LIKE?", "#{word}")
        elsif search == "forward_match"
          @work = Work.where("name LIKE?","#{word}%")
        elsif search == "backward_match"
          @work = Work.where("name LIKE?","%#{word}")
        elsif search == "partial_match"
          @work = Work.where("name LIKE?","%#{word}%")
        else
          @work = Work.all
        end
    end

end
