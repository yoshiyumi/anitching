class Favorite < ApplicationRecord
    belongs_to :customer
    belongs_to :work
    
    validates_uniqueness_of :work_id, scope: :customer_id 
end
