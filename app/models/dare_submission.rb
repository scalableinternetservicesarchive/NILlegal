class DareSubmission < ApplicationRecord
  belongs_to :user
  belongs_to :dare
  validates :user_id, presence: true
  validates :dare_id, presence: true
  validates :content, presence: true
  
end
