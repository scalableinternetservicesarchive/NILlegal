module DaresHelper
  def cache_key_for_dare(dare)
    "dare-#{dare.id}-#{dare.updated_at}-#{dare.comments.count}-#{dare.dare_submissions.count}"
  end
  
  def cache_key_for_dare_table
    "dare-table-#{Dare.maximum(:updated_at)}-#{Comment.maximum(:updated_at)}-#{DareSubmission.maximum(:updated_at)}"
  end

  
end
