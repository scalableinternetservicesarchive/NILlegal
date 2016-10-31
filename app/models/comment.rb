class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :dare
    validates :body, presence: true, length: { maximum: 140 }
    default_scope -> { order(created_at: :desc) }
end
