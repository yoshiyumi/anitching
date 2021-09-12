class Comment < ApplicationRecord
    belongs_to :customer
    belongs_to :review
    belongs_to :parent,  class_name: "Comment", optional: true
    has_many   :replies, class_name: "Comment", foreign_key: :parent_id, dependent: :destroy
    validates :comment, presence: true, length: { in: 1..1000 }
end
