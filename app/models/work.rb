class Work < ApplicationRecord
    has_many :tagmaps, dependent: :destroy
    has_many :tags, through: :tagmaps
    belongs_to :genre
    belongs_to :customer
    has_many :reviews, dependent: :destroy
    has_many :favorites, dependent: :destroy
    
    
    
    attachment :image
    
    
   accepts_nested_attributes_for :tags, allow_destroy: true

end
