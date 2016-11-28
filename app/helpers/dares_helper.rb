module DaresHelper
  def cache_key_for_dare(dare)
    "dare-#{dare.id}-#{dare.user.name}-#{dare.updated_at}-#{dare.comments.count}-#{dare.dare_submissions.count}"
  end
  
  def cache_key_for_dare_time(dare)
    "dare_time-#{dare.id}-#{time_ago_in_words(dare.created_at)}"
  end
  
  def cache_key_for_dare_update(dare)
    "dare_update-#{dare.id}-#{dare.updated_at}"
  end
  
  def cache_key_for_dare_user(dare)
    "dare_user-#{dare.id}-#{dare.user.name}"
  end
  
  def cache_key_for_dare_count(dare)
    "dare_count-#{dare.id}-#{dare.comments.count}-#{dare.dare_submissions.count}"
  end
  
  def cache_key_for_dare_table
    "dare-table-#{Dare.maximum(:updated_at)}-#{Comment.maximum(:updated_at)}-#{DareSubmission.maximum(:updated_at)}"
  end

  
end
