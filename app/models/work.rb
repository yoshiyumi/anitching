class Work < ApplicationRecord
    has_many :tagmaps, dependent: :destroy
    has_many :tags, through: :tagmaps
    belongs_to :genre
    has_many :reviews, dependent: :destroy
    
    attachment :image
    def save_tags(tag_ids)
      tag_ids.each do |id|
        tagmaps.create!(tag_id: id)
      end
    end  
    
 

end
