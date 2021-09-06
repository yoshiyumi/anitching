class Review < ApplicationRecord
     belongs_to :customer
     belongs_to :work
     has_many :comments, dependent: :destroy
    
end
