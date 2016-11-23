class DareSubmission < ApplicationRecord
  belongs_to :user
  belongs_to :dare
  has_many :submission_likes
  validates :user_id, presence: true
  validates :dare_id, presence: true
  VALID_YOUTUBE_REGEX = /\Ahttps\:\/\/www\.youtube\.com\/watch\?v\=[A-Za-z0-9\-\_\&\=]+\z/
  validates :content, presence: true,
                      format: { with: VALID_YOUTUBE_REGEX }
  validates :description, presence: true
  
  
  
  
end
