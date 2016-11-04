class SubmissionLike < ApplicationRecord
  belongs_to :user
  belongs_to :dare_submission
  validates :user, uniqueness: {scope: :dare_submission}
end
